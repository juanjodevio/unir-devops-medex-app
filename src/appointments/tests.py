from django.test import TestCase


# Create your tests here.
class MockTestCase(TestCase):
    def test_mock(self):
        self.assertEqual(1, 1)
