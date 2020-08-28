from django.urls import path
from users import views

urlpatterns = [
    path('getcode/', views.get_unique_code, name='get_code'),
    path('authenticatesession/', views.authenticate_session, name='auth_session'),
    path('adduser/', views.add_user, name='add_user'),
    path('getpatientdetails/', views.get_patient_details, name='get_patient_details'),
    path('addappointment/', views.add_appointment, name='add_appointment'),
    path('sendbroadcast/', views.send_broadcast_sms, name='broadcast'),
]
