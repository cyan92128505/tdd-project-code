import 'package:money/money.dart';

class Portfolio {
  List<Money> moneys = [];

  add(Money money) {
    moneys.add(money);
  }

  evaluate(String currency) {
    var total =
        moneys.map((e) => e.amount).reduce((value, element) => value + element);

    return Money(total, currency);
  }
}
