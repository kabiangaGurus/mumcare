from django.db import models
from django.contrib.auth.models import User
from core_app.utils.utils import *


# Create your models here.

def gen():
    return generate_code(n=100)


class CustomUser(User):
    role = models.ForeignKey('Role', on_delete=models.CASCADE)
    session_id = models.CharField(max_length=100, default=gen, unique=True)
    phone_number = models.CharField(max_length=10, unique=True, blank=False)
    location = models.CharField(max_length=100)

    # username = models.CharField(max_length=100, unique=False)

    def has_role(self, role: str):
        return self.role.role_name == role

    def __str__(self):
        return self.first_name + '_' + self.last_name

    def save(self, *args, **kwargs):
        try:
            self.username = self.first_name + "_" + self.last_name + generate_code(n=10)
        except Exception:
            self.username = ""
        super(CustomUser, self).save(*args, **kwargs)


class Role(models.Model):
    role_name = models.CharField(max_length=100, null=False, blank=False)

    def __str__(self):
        return self.role_name


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


class AuthenticationCodes(models.Model):
    expiry = models.DateField(null=False, blank=False, default=evaluate_expiry)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    auth_code = models.CharField(max_length=8)
