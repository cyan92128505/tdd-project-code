import 'package:money/money.dart';
import 'package:test/test.dart';

void main() {
  test('5 x 2 = 10', () {
    var actual = Money(5, 'USD');
    var expected = Money(10, 'USD');

    expect(expected, actual.times(2));
  });

  test('10 EUR x 2 = 20 EUR', () {
    var actual = Money(10, 'EUR');
    var expected = Money(20, 'EUR');

    expect(expected, actual.times(2));
  });

  test('4002 KRW / 4 = 1000.5 KRW', () {
    var actual = Money(4002, 'KRW');
    var expected = Money(1000.5, 'KRW');

    expect(expected, actual.divide(4));
  });
}
