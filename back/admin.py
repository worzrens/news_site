from django.contrib import admin

# Register your models here.
from django.contrib.auth.admin import UserAdmin

from .forms import CreateUserForm, ChangeUserForm
from .models import User, Post, Comment


class CustomUserAdmin(UserAdmin):
    add_form = CreateUserForm
    model = User
    # exclude = ("username",)
    list_display = ['email', 'role', 'is_superuser']

    fieldsets = (
        ('Required info', {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('name', 'last_name', 'date_of_birth')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'role', 'user_permissions')}),
    )
    ordering = ('email',)


admin.site.register(User, CustomUserAdmin)

MODELS_TO_REGISTER = [Post, Comment]
admin.site.register(MODELS_TO_REGISTER)
