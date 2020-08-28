from django.db import models
from django.contrib.auth.models import User
from core_app.utils.utils import *
from django.contrib import admin


# Create your models here.

class CustomUser(User):
    role = models.ForeignKey('Role', on_delete=models.CASCADE)
    session_id = models.CharField(max_length=100, default='', unique=True)
    phone_number = models.CharField(max_length=10, unique=True)
    location = models.CharField(max_length=100)

    def has_role(self, role: str):
        return self.role.role_name == role


admin.site.register(CustomUser)


class Role(models.Model):
    role_name = models.CharField(max_length=100, null=False, blank=False)


admin.site.register(Role)

APPOINTMENT_STATUS = [
    ('N', 'None'),
    ('T', 'TRUE'),
    ('F', 'False'),
]


class Appointment(models.Model):
    appointment_date = models.DateField(null=False, blank=False)
    patient = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='patient')
    doctor = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='doctor')
    status = models.CharField(
        max_length=10,
        choices=APPOINTMENT_STATUS,
        default='N')


admin.site.register(Appointment)


class AuthenticationCodes(models.Model):
    expiry = models.DateField(null=False, blank=False, default=evaluate_expiry)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    auth_code = models.CharField(max_length=8)
