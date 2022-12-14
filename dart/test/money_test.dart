import 'package:money/money.dart';
import 'package:test/test.dart';

void main() {
  test('5 x 2 = 10', () {
    var fiver = Money(5, 'USD');
    var tenner = fiver.times(2);

    expect(tenner.amount, 10);
    expect(tenner.currency, 'USD');
  });

  test('10 EUR x 2 = 20 EUR', () {
    var tenEUR = Money(10, 'EUR');
    var twentyEUR = tenEUR.times(2);

    expect(twentyEUR.amount, 20);
    expect(twentyEUR.currency, 'EUR');
  });

  test('4002 KRW / 4 = 1000.5 KRW', () {
    var originMoney = Money(4002, 'KRW');

    var actualMoneyAfterDivision = originMoney.divide(4);
    var expectedMoneyAfterDivision = Money(1000.5, 'KRW');

    expect(expectedMoneyAfterDivision.amount, actualMoneyAfterDivision.amount);
    expect(
        expectedMoneyAfterDivision.currency, actualMoneyAfterDivision.currency);
  });
}
