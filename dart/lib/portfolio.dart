import 'package:money/money.dart';

import 'bank.dart';

class Portfolio {
  List<Money> moneys = [];

  void add(Money money) {
    moneys.add(money);
  }

  Money evaluate(Bank bank, String currency) {
    List<String> failures = [];
    var total = moneys.map((m) {
      try {
        var result = bank.convert(m, currency);
        return result?.amount;
      } catch (e) {
        failures.add('${m.currency}->$currency');
      }
    }).reduce(
      (total, amount) {
        final tempTotal = total ?? 0;
        final tempAmount = amount ?? 0;
        return tempTotal + tempAmount;
      },
    );

    if (failures.isEmpty) {
      return Money(total!, currency);
    }

    throw UnsupportedError('Missing exchange rate(s):[${failures.join(',')}]');
  }
}
