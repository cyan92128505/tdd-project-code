import unittest

from money import Money
from money import Portfolio


class TestMoney(unittest.TestCase):
    def testMultiplicationInDollar(self):
        fiveDollars = Money(5, 'USD')
        tenDollars = Money(10, 'USD')
        self.assertEqual(tenDollars, fiveDollars.times(2))

    def testMultiplicationInEuros(self):
        tenEuros = Money(10, 'EUR')
        twentyEuros = Money(20, 'EUR')
        self.assertEqual(twentyEuros, tenEuros.times(2))

    def testDivision(self):
        originMoney = Money(4002, 'KRW')
        actualMoneyAfterDivision = originMoney.divide(4)
        expectedMoneyAfterDivision = Money(1000.5, 'KRW')
        self.assertEqual(expectedMoneyAfterDivision,
                         actualMoneyAfterDivision)

    def testAddition(self):
        fiveDollars = Money(5, "USD")
        tenDollars = Money(10, "USD")
        fifteenDollars = Money(15, "USD")
        portfolio = Portfolio()
        portfolio.add(fiveDollars)
        portfolio.add(tenDollars)
        self.assertEqual(fifteenDollars, portfolio.evaluate("USD"))


if __name__ == '__main__':
    unittest.main()
