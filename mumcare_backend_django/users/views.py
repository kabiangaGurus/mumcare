from django.views.decorators.csrf import csrf_exempt
from core_app.utils.utils import (
    generate_code,
    send_sms
)
from core_app.settings import BASE_DIR
from django.http import (
    HttpResponse,
    HttpResponseBadRequest,
    HttpResponseForbidden,
    HttpResponseNotFound,
)

from django.core.handlers.wsgi import WSGIRequest

from users.models import AuthenticationCodes, CustomUser, Appointment
import json
from datetime import datetime


# Create your views here

def post(func):
    # decorator
    def wrapper(*args, **kw):
        request = args[0]
        if not isinstance(request, WSGIRequest):
            raise ValueError('Invalid request..')

        if request.method == 'POST':
            return func(*args, **kw)
        else:
            return HttpResponseBadRequest()

    return wrapper


def authenticate_request(request, session_id):
    try:
        user = CustomUser.objects.get(session_id=session_id)
        request.user = user

        return request
    except Exception:
        response_json = {
            'status': '403',
            'Message': 'User does not exist'
        }
        return HttpResponseForbidden(json.dumps(response_json), content_type='application/json')


@csrf_exempt
@post
def get_unique_code(request):
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

    phone = '+254' + str(int(phone))

    send_sms(f'Your verification code is : {auth_code}', [phone])
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
@post
def authenticate_session(request):
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
            session_id = generate_code(n=100)
            user.session_id = session_id

            user.save()

            response_json = {
                'status': '403',
                'Message': 'Successfully logged in',
                'role': user.role,
                'session_id': session_id,
            }
            return HttpResponse(json.dumps(response_json), content_type='application/json')

    except Exception:
        response_json = {
            'status': '403',
            'Message': 'User does not exist'
        }
        return HttpResponseForbidden(json.dumps(response_json), content_type='application/json')


@csrf_exempt
@post
def add_user(request):
    try:
        f_name = request.POST['first_name']
        l_name = request.POST['last_name']

        phone = request.POST['phone_number']
        location = request.POST['location']
    except KeyError:
        return HttpResponseBadRequest()

    CustomUser.objects.create(
        first_name=f_name,
        last_name=l_name,
        phone_number=phone,
        location=location
    ).save()
    return HttpResponse()


@csrf_exempt
@post
def get_patient_details(request):
    try:
        f_name = request.POST['first_name']
        l_name = request.POST['last_name']
        session_id = request.POST['session_id']

        phone = request.POST['phone_number']
    except KeyError:
        return HttpResponseBadRequest()

    request = authenticate_request(request, session_id)
    if isinstance(request, HttpResponseForbidden):
        return request

    try:
        patient = CustomUser.objects.get(
            first_name=f_name,
            last_name=l_name,
            phone=phone,
        )
    except Exception:
        return HttpResponseForbidden('Invalid credentials')

    appontment = Appointment.objects.filter(patient=patient)
    apointment_list = list()

    for ap in appontment:
        m_dict = dict()
        m_dict['date'] = ap.appointment_date.strftime("%D-%m-%Y")
        m_dict['status'] = ap.status

        apointment_list.append(m_dict)

    json_response = {
        'name': patient.first_name,
        'appointments': apointment_list
    }

    return HttpResponse(json.dumps(json_response), content_type='application/json')


@csrf_exempt
@post
def add_appointment(request):
    try:
        phone_number = request.POST['phone_number']
        # format dd-mm-yyyy
        date = request.POST['date']
        session_id = request.POST['session_id']
    except KeyError:
        return HttpResponseBadRequest()

    date = datetime.strptime(date, '%D-%m-%Y')
    doctor = CustomUser.objects.get(session_id=session_id)
    patient = CustomUser.objects.get(phone_number=phone_number)

    Appointment.objects.create(
        patient=patient,
        doctor=doctor,
        date=date,
    ).save()

    return HttpResponse()


def load_static(request, path=''):
    ext = path.split('.')[-1]
    if ext == 'css':
        content_type = 'text/css'
    elif ext == 'js':
        content_type = 'application/javascript'
    elif ext == 'ico':
        content_type = 'image,x-icon'
    elif ext == 'png':
        content_type = 'image/png'
    elif ext == 'jpg' or ext == 'jpeg':
        content_type = 'image,jpeg'
    else:
        content_type = ''

    try:
        pathx = 'static/' + path
        with open(pathx, 'rb') as f:
            data = f.read()
        return HttpResponse(data, content_type=content_type)
    except FileNotFoundError:
        return HttpResponseNotFound()
    except Exception:
        return HttpResponseNotFound()

