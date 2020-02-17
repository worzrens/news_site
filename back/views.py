import logging

from django.contrib.auth import authenticate, login, get_user_model, update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.utils.encoding import force_text
from django.utils.http import urlsafe_base64_decode
from django.views import View

from .forms import CreateUserForm
from .models import Post, Comment
from .tasks import send_confirmation_letter, notify_about_comment
from .tokens import account_activation_token


def index(request):
    return redirect(r'home')


@login_required
def home(request):
    return render(request, 'home.html')


@login_required
def email_confirmed(request):
    return render(request, 'auth/email_confirmed.html')


def register(request):
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            send_confirmation_letter.apply_async((), {
                'user_pk': user.pk,
                'user_email': user.email,
                'user_name': "User" if str(user.name) == 'None' else user.name
            })

            login(request, user)
            return redirect('home')
    else:
        form = CreateUserForm()
    return render(request, 'auth/register.html', {'form': form})


def logout(request):
    logout(request)


class ActivateUser(View):

    def get(self, request):
        uidb64 = request.GET.get('uid')
        token = request.GET.get('token')
        User = get_user_model()

        try:
            uid = force_text(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=uid)
        except(TypeError, ValueError, OverflowError, User.DoesNotExist):
            user = None
        if user is not None and account_activation_token.check_token(user, token):
            user.is_active = True
            user.save()
            login(request, user)

            return redirect('email_confirmed')
            # return render(request, 'email_confirmed.html', {'user': request.user})

        else:
            return render(request, 'home.html', {"message": 'Activation link is invalid!'})


def posts(request):
    all_posts = Post.objects.filter(status='approved')
    your_posts = Post.objects.filter(status='approved').filter(created_by=request.user)
    return render(request, 'posts/list_posts.html', {"all_posts": all_posts, 'your_posts': your_posts})


def comments(request, post_id):
    if request.method == 'GET':
        template_name = 'posts/create_comment.html'
        return render(request, template_name)
    if request.method == 'POST':
        user = request.user
        if not user.is_active:
            return render(request, 'home.html', {"message": 'Not verified users cannot create posts or comment'})
        text = request.POST.get('text')
        to_post = Post.objects.get(id=post_id)

        comment = Comment(text=text, to_post=to_post, created_by=user)
        comment.save()

        notify_about_comment.apply_async((), {
            'to_user_email': to_post.created_by.email,
            'from_user_email': user.email,
            'post_text': to_post.message,
            'comment_text': text
        })
        return redirect('posts')


def new_post(request):
    if request.method == 'GET':
        template_name = 'posts/create_post.html'
        return render(request, template_name)

    if request.method == 'POST':
        user = request.user

        if not user.is_active:
            return render(request, 'home.html', {"message": 'Not verified users cannot create posts or comment'})
        message = request.POST.get('message')

        if user.role != 'user':
            post = Post(message=message, created_by=user, status='approved')
            post.save()
            return redirect('posts')
        else:
            post = Post(message=message, created_by=user)
            post.save()
            return render(request, 'home.html', {"message": 'Waiting for post approval'})

