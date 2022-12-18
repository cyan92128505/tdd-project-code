import 'package:money/money.dart';
import 'package:money/portfolio.dart';
import 'package:test/test.dart';

void main() {
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

    expect(fifteenDollars, portfolio.evaluate("USD"));
  });
}
