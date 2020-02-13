from django.contrib import admin

# Register your models here.
from django.contrib.auth.admin import UserAdmin

from back.forms import CreateUserForm, ChangeUserForm
from back.models import NewsSiteUser, Post, Comment


class CustomUserAdmin(UserAdmin):
    add_form = CreateUserForm
    form = ChangeUserForm
    model = NewsSiteUser
    exclude = ("username",)

    fieldsets = (
        ('Required info', {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('name', 'last_name', 'date_of_birth')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
    )
    ordering = ('email',)


admin.site.register(NewsSiteUser, CustomUserAdmin)

MODELS_TO_REGISTER = [Post, Comment]
admin.site.register(MODELS_TO_REGISTER)
