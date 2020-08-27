import random
import string
from datetime import datetime
import datetime as dt
import africastalking

sms = africastalking.SMS


def generate_code(n=8):
    return "".join(random.choices(string.ascii_uppercase + string.digits, k=n))


def evaluate_expiry() -> datetime:
    return datetime.now() + dt.timedelta(minutes=10)


def send_sms(message: str, phone: list):
    message = '[ANC] ' + message
    if len(message) > 160:
        raise ValueError(f"Message should be 160 characters long MSG: {message}")
    resp = sms.send(message, phone)
    print(resp)
