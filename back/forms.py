import datetime

from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.core.exceptions import ValidationError
from django.forms import ModelForm
from django.utils.translation import ugettext_lazy as _

from back.models import NewsSiteUser


class CreateUserForm(UserCreationForm):
    class Meta:
        model = NewsSiteUser
        exclude = ('username',)
        fields = ['email', 'password', 'name', 'last_name', 'date_of_birth']


class ChangeUserForm(UserChangeForm):
    class Meta:
        model = NewsSiteUser
        exclude = ('username',)
        fields = ['email', 'password', 'name', 'last_name', 'date_of_birth']

    # email = forms.EmailField()
    # password1 = forms.PasswordInput()
    # password2 = forms.PasswordInput()
    #
    # name = forms.CharField(required=False)
    # last_name = forms.CharField(required=False)
    # date_of_birth = forms.DateTimeField(required=False)
    #
    # def clean_password1(self):
    #     pasw1 = self.cleaned_data['password1']
    #     pasw2 = self.cleaned_data['password2']
    #
    #     if not pasw1 or not pasw2:
    #         raise ValidationError(_('Both password fields must be filled'))
    #     if pasw1 != pasw2:
    #         raise ValidationError(_('Passwords don\'t match'))
    #
    #     return pasw1