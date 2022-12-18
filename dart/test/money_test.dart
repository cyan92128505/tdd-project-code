import 'package:money/bank.dart';
import 'package:money/money.dart';
import 'package:money/portfolio.dart';
import 'package:test/test.dart';

void main() {
  final testBank = Bank();

  testBank.addExchangeRate('EUR', 'USD', 1.2);
  testBank.addExchangeRate('USD', 'KRW', 1100);

  test('Test Multiplication: 5 x 2 = 10', () {
    var actual = Money(5, 'USD');
    var expected = Money(10, 'USD');

    expect(expected, actual.times(2));
  });

  test('Test Division: 4002 KRW / 4 = 1000.5 KRW', () {
    var actual = Money(4002, 'KRW');
    var expected = Money(1000.5, 'KRW');

    expect(expected, actual.divide(4));
  });

  test('Test Addtion: 10 USD + 5 USD = 15 USD', () {
    var fiveDollars = Money(5, "USD");
    var tenDollars = Money(10, "USD");
    var fifteenDollars = Money(15, "USD");

    var portfolio = Portfolio();
    portfolio.add(fiveDollars);
    portfolio.add(tenDollars);

    expect(fifteenDollars, portfolio.evaluate(testBank, "USD"));
  });

  test('TestAddtionOfDollarsAndEuros', () {
    var fiveDollars = Money(5, "USD");
    var tenEuros = Money(10, "EUR");
    var expacted = Money(17, "USD");

    var portfolio = Portfolio();
    portfolio.add(fiveDollars);
    portfolio.add(tenEuros);

    var actual = portfolio.evaluate(testBank, "USD");

    expect(actual, expacted);
  });

  test('TestAddtionOfDollarsAndWons', () {
    var oneDollars = Money(1, "USD");
    var elevenHundredWons = Money(1100, "KRW");
    var expacted = Money(2200, "KRW");

    var portfolio = Portfolio();
    portfolio.add(oneDollars);
    portfolio.add(elevenHundredWons);

    var actual = portfolio.evaluate(testBank, "KRW");

    expect(actual, expacted);
  });

  test('TestAdditionWithMultipleMissingExchangeRates', () {
    expect(
      () {
        var portfolio = Portfolio();

        var oneDollars = Money(1, "USD");
        var oneEuros = Money(1, "EUR");
        var oneWon = Money(1, "KRW");

        portfolio.add(oneDollars);
        portfolio.add(oneEuros);
        portfolio.add(oneWon);

        portfolio.evaluate(testBank, "Kalganid");
      },
      throwsA(
        predicate((e) =>
            e is UnsupportedError &&
            e.message ==
                'Missing exchange rate(s):[USD->Kalganid,EUR->Kalganid,KRW->Kalganid]'),
      ),
    );
  });

  test('TestConversion', () {
    var bank = Bank();
    bank.addExchangeRate("EUR", "USD", 1.2);
    var tenEuros = Money(10, "EUR");
    var actual = bank.convert(tenEuros, "USD");
    var expacted = Money(12, "USD");

    expect(actual, expacted);
  });

  test('TestConversionMissingExchangeRate', () {
    var bank = Bank();
    var tenEuros = Money(10, "EUR");

    expect(
      () {
        bank.convert(tenEuros, "Kalganid");
      },
      throwsA(
        predicate((e) => e is UnsupportedError && e.message == "EUR->Kalganid"),
      ),
    );
  });
}
