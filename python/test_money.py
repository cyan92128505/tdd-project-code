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

    def testDivision(self):
        originMoney = Money(4002, 'KRW')
        actualMoneyAfterDivision = originMoney.divide(4)
        expectedMoneyAfterDivision = Money(1000.5, 'KRW')
        self.assertEqual(expectedMoneyAfterDivision.amount,
                         actualMoneyAfterDivision.amount)
        self.assertEqual(expectedMoneyAfterDivision.currency,
                         actualMoneyAfterDivision.currency)


if __name__ == '__main__':
    unittest.main()
