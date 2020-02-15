from django.contrib.auth import authenticate, login, get_user_model, update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.utils.encoding import force_text
from django.utils.http import urlsafe_base64_decode
from django.views import View

from .forms import CreateUserForm
from .tasks import send_confirmation_letter
from .tokens import account_activation_token


@login_required
def home(request):
    return render(request, 'home.html')


@login_required
def email_confirmed(request):
    return render(request, 'email_confirmed.html')


def register(request):
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            send_confirmation_letter.apply_async((), {'user_pk': user.pk, 'user_email': user.email, 'user_name': "User" if str(user.name)=='None' else user.name})

            login(request, user)
            return redirect('home')
    else:
        form = CreateUserForm()
    return render(request, 'register.html', {'form': form})


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
            return HttpResponse('Activation link is invalid!')

    def post(self, request):
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            return HttpResponse('Password changed successfully')
