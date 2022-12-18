import unittest

from money import Money
from portfolio import Portfolio
from bank import Bank


class TestMoney(unittest.TestCase):
    def setUp(self):
        self.bank = Bank()
        self.bank.addExchangeRate("EUR", "USD", 1.2)
        self.bank.addExchangeRate("USD", "KRW", 1100)

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
        self.assertEqual(fifteenDollars, portfolio.evaluate(self.bank, "USD"))

    def testAddtionOfDollarsAndEuros(self):
        fiveDollars = Money(5, "USD")
        tenEuros = Money(10, "EUR")
        portfolio = Portfolio()
        portfolio.add(fiveDollars)
        portfolio.add(tenEuros)
        actual = portfolio.evaluate(self.bank, "USD")
        excepted = Money(17, "USD")
        self.assertEqual(actual, excepted)

    def testAddtionOfDollarsAndWons(self):
        oneDollars = Money(1, "USD")
        elevenHundredWons = Money(1100, "KRW")
        portfolio = Portfolio()
        portfolio.add(oneDollars)
        portfolio.add(elevenHundredWons)
        actual = portfolio.evaluate(self.bank, "KRW")
        excepted = Money(2200, "KRW")
        self.assertEqual(actual, excepted)

    def testAdditionWithMultipleMissingExchangeRates(self):
        oneDollar = Money(1, "USD")
        oneEuro = Money(1, "EUR")
        oneWon = Money(1, "KRW")

        portfolio = Portfolio()
        portfolio.add(oneDollar)
        portfolio.add(oneEuro)
        portfolio.add(oneWon)

        with self.assertRaisesRegex(
            Exception,
            "Missing exchange rate\(s\):\[USD->Kalganid,EUR->Kalganid,KRW->Kalganid]",
        ):
            portfolio.evaluate(self.bank, "Kalganid")

    def testConversion(self):
        bank = Bank()
        bank.addExchangeRate("EUR", "USD", 1.2)
        tenEuros = Money(10, "EUR")
        actual = bank.convert(tenEuros, "USD")
        excepted = Money(12, "USD")
        self.assertEqual(actual, excepted)

    def testConversionMissingExchangeRate(self):
        bank = Bank()
        tenEuros = Money(10, "EUR")

        with self.assertRaisesRegex(Exception, "EUR->Kalganid"):
            bank.convert(tenEuros, "Kalganid")


if __name__ == '__main__':
    unittest.main()
