import unittest

from money import Money


class TestMoney(unittest.TestCase):
    def testMultiplicationInDollar(self):
        fiver = Money(5, 'USD')
        tenner = fiver.times(2)
        self.assertEqual(10, tenner.amount)
        self.assertEqual('USD', tenner.currency)

    def testMultiplicationInEuros(self):
        tenEuros = Money(10, 'EUR')
        twentyEuros = tenEuros.times(2)
        self.assertEqual(20, twentyEuros.amount)
        self.assertEqual('EUR', twentyEuros.currency)


if __name__ == '__main__':
    unittest.main()
