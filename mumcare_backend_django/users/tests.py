from django.test import TestCase, Client, RequestFactory
from django.urls import reverse


# Create your tests here.

class TestViews(TestCase):
    def setUp(self) -> None:
        self.client = Client()
        self.request_factory = RequestFactory()

    def test_post_decorator(self):
        data = {
            'phone_number': '0716864539'
        }
        response = self.client.post(reverse('api:get_code'), data=data)
        print(response.META)

        self.assertEqual(response.status_code, 200)
