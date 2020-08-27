from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from core_app.utils import custom_responses
from core_app.utils.utils import (
    generate_code,
    send_sms
)
from django.http import (
    HttpResponse,
    HttpResponseBadRequest,
    HttpResponseForbidden
)
from users.models import AuthenticationCodes, CustomUser
import json
from datetime import datetime


# Create your views here

@csrf_exempt
def get_unique_code(request):
    if request.method == 'POST':
        try:
            phone = request.POST['phone_number']
        except KeyError:
            return HttpResponseBadRequest(content_type='application/json')

        auth_code = generate_code()
        try:
            user = CustomUser.objects.get(phone_number=phone)
        except Exception:
            response_json = {
                'status': '403',
                'Message': 'User does not exist'
            }
            return HttpResponseForbidden(json.dumps(response_json), content_type='application/json')

        send_sms(f'Your verification code is : {auth_code}')
        AuthenticationCodes.objects.create(
            auth_code=auth_code,
            user=user,
        ).save()

        response_json = {
            'status': '200',
            'Message': 'Success. You will receive a sms with auth code'
        }
        return HttpResponse(json.dumps(response_json), content_type='application/json')


@csrf_exempt
def authenticate_session(request):
    if request.method == 'POST':
        try:
            code = request.POST['auth_code']
            phone = request.POST['phone_number']
        except KeyError:
            return HttpResponseBadRequest(content_type='application/json')

        try:
            user = CustomUser.objects.get(phone_number=phone)
            auth_data = AuthenticationCodes.objects.get(user=user, auth_code=code)

            if auth_data.expiry < datetime.now():
                response_json = {
                    'status': '403',
                    'Message': 'Code expired'
                }
                return HttpResponseForbidden(json.dumps(response_json), content_type='application/json')
            else:
                response_json = {
                    'status': '403',
                    'Message': 'Successfully logged in',
                    'role': user.role,
                }
                return HttpResponse(json.dumps(response_json), content_type='application/json')

        except Exception:
            response_json = {
                'status': '403',
                'Message': 'User does not exist'
            }
            return HttpResponseForbidden(json.dumps(response_json), content_type='application/json')
