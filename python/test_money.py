import unittest

from money import Money
from portfolio import Portfolio


class TestMoney(unittest.TestCase):
    def testMultiplication(self):
        fiveDollars = Money(5, 'USD')
        tenDollars = Money(10, 'USD')
        self.assertEqual(tenDollars, fiveDollars.times(2))

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

    def testAddtionOfDollarsAndEuros(self):
        fiveDollars = Money(5, "USD")
        tenEuros = Money(10, "EUR")
        portfolio = Portfolio()
        portfolio.add(fiveDollars)
        portfolio.add(tenEuros)
        actual = portfolio.evaluate("USD")
        excepted = Money(17, "USD")
        self.assertEqual(actual, excepted)

    def testAddtionOfDollarsAndWons(self):
        oneDollars = Money(1, "USD")
        elevenHundredWons = Money(1100, "KRW")
        portfolio = Portfolio()
        portfolio.add(oneDollars)
        portfolio.add(elevenHundredWons)
        actual = portfolio.evaluate("KRW")
        excepted = Money(2200, "KRW")
        self.assertEqual(actual, excepted)


if __name__ == '__main__':
    unittest.main()
