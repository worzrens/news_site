from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect

from back.forms import CreateUserForm


@login_required
def home(request):
    return render(request, 'home.html')


def register(request):
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            # email = form.cleaned_data.get('email')
            # raw_password = form.cleaned_data.get('password')
            #
            # name = form.cleaned_data.get('name')
            # last_name = form.cleaned_data.get('last_name')
            # date_of_birth = form.cleaned_data.get('date_of_birth')
            #
            # user = authenticate(email=email, password=raw_password, name=name, last_name=last_name, date_of_birth=date_of_birth)
            login(request, user, backend='django.contrib.auth.backends.ModelBackend')
            return redirect('home')
    else:
        form = CreateUserForm()
    return render(request, 'register.html', {'form': form})


def logout(request):
    logout(request)