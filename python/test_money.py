import unittest

from money import Dollar
from money import Money


class TestMoney(unittest.TestCase):
    def testMultiplication(self):
        fiver = Dollar(5)
        tenner = fiver.times(2)
        self.assertEqual(10, tenner.amount)

    def testMultiplicationInEuros(self):
        tenEuros = Money(10, 'EUR')
        twentyEuros = tenEuros.times(2)
        self.assertEqual(20, twentyEuros.amount)
        self.assertEqual('EUR', twentyEuros.currency)


if __name__ == '__main__':
    unittest.main()
