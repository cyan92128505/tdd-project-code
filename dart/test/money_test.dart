import 'package:money/money.dart';
import 'package:test/test.dart';

void main() {
  test('5 x 2 = 10', () {
    var fiver = new Dollar(5);
    var tenner = fiver.times(2);

    expect(tenner.amount, 10);
  });
}
