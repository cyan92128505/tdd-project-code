import 'package:money/money.dart';

class Portfolio {
  List<Money> moneys = [];
  final _eurToUsd = 1.2;

  void add(Money money) {
    moneys.add(money);
  }

  Money evaluate(String currency) {
    var total = moneys
        .map((e) => _convert(e, currency))
        .reduce((total, amount) => total + amount);

    return Money(total, currency);
  }

  double _convert(Money money, String currency) {
    if (money.currency == currency) {
      return money.amount;
    }

    Map<String, double> exchangeRates = {
      "EUR->USD": 1.2,
      "USD->KRW": 1100,
    };
    String key = '${money.currency}->$currency';
    double rate = exchangeRates[key] ?? 0;

    return money.amount * rate;
  }
}
