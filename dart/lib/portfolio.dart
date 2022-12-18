import 'package:money/money.dart';

class Portfolio {
  List<Money> moneys = [];

  void add(Money money) {
    moneys.add(money);
  }

  Money evaluate(String currency) {
    List<String> failures = [];
    var total = moneys.map((e) {
      var result = _convert(e, currency);
      if (result == 0) {
        failures.add('${e.currency}->$currency');
      }
      return result;
    }).reduce((total, amount) => total + amount);

    if (failures.isEmpty) {
      return Money(total, currency);
    }

    throw UnsupportedError('Missing exchange rate(s):[${failures.join(',')}]');
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
