import logging

from ckeditor.fields import RichTextField
from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from .models import User, Post, Comment


class ChangePostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('message', 'status')


class ChangeCommentForm(forms.ModelForm):
    # message = RichTextField()

    class Meta:
        model = Comment
        fields = ('text',)


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        exclude = ('username',)
        fields = ['email', 'name', 'last_name', 'date_of_birth']


class LoginForm(AuthenticationForm):
    def confirm_login_allowed(self, user):
        pass

