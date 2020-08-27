from django.http import HttpResponse, HttpResponseForbidden
import json

forbbiden_json = {
    'status': '403',
    'Message': 'You do not have the correct perms to access this site'
}

forbidden_response = HttpResponseForbidden(json.dumps(forbbiden_json), content_type='application/json')
