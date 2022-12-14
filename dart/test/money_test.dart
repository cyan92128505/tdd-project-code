import 'package:money/money.dart';
import 'package:test/test.dart';

void main() {
  test('5 x 2 = 10', () {
    var fiver = new Money(5, 'USD');
    var tenner = fiver.times(2);

    expect(tenner.amount, 10);
    expect(tenner.currency, 'USD');
  });


  test('10 EUR x 2 = 20 EUR', () {
    var tenEUR = new Money(10, 'EUR');
    var twentyEUR = tenEUR.times(2);

    expect(twentyEUR.amount, 20);
    expect(twentyEUR.currency, 'EUR');
  });
}
