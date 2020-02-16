import logging

from django.contrib.auth.forms import UserCreationForm, UserChangeForm, AuthenticationForm
from .models import User


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        exclude = ('username',)
        fields = ['email', 'name', 'last_name', 'date_of_birth']


class ChangeUserForm(UserChangeForm):
    class Meta:
        model = User
        exclude = ('username',)
        fields = ['email', 'name', 'last_name', 'date_of_birth']


class LoginForm(AuthenticationForm):
    def confirm_login_allowed(self, user):
        logging.info('using custom login')
        pass

