from django.contrib import admin
from users.models import (
    CustomUser,
    Role,
    Appointment
)


# Register your models here.
class RoleAdmin(admin.ModelAdmin):
    fields = ('role_name',)
    list_display = ('id', 'role_name')


class UserAdmin(admin.ModelAdmin):
    fields = ('first_name', 'last_name', 'location', 'phone_number', 'role')
    list_display = ('first_name', 'last_name', 'location', 'phone_number', 'role', 'username')


admin.site.register(Role, RoleAdmin)
admin.site.register(CustomUser, UserAdmin)
admin.site.register(Appointment)
