from django.test import SimpleTestCase
from app import calc


class TestCalcFunctions(SimpleTestCase):
    def test_add_numbers(self):
        res = calc.add_numbers(10, 5)
        self.assertEqual(res, 15)

    def test_sub_numbers(self):
        res = calc.sub_numbers(10, 15)
        self.assertEqual(res, 5)
