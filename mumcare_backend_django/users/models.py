from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.

class User(AbstractUser):
    role = models.ForeignKey('Role', on_delete=models.CASCADE)

    def has_role(self, role: str):
        return self.role.role_name == role


class Role(models.Model):
    role_name = models.CharField(max_length=100, null=False, blank=False)


APPOINTMENT_STATUS = [
    ('N', 'None'),
    ('T', 'TRUE'),
    ('F', 'False'),
]


class Appointment(models.Model):
    appointment_date = models.DateField(null=False, blank=False)
    patient = models.ForeignKey(User, on_delete=models.CASCADE)
    doctor = models.ForeignKey(User, on_delete=models.CASCADE)
    status = models.CharField(
        max_length=10,
        choices=APPOINTMENT_STATUS,
        default='N')
