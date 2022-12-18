import 'money.dart';

class Bank {
  Map<String, double> exchangeRates = {};

  Bank();

  addExchangeRate(
    String currencyFrom,
    String currencyTo,
    double rate,
  ) {
    final key = '$currencyFrom->$currencyTo';
    exchangeRates[key] = rate;
  }

  Money? convert(Money money, String currency) {
    if (money.currency == currency) {
      return Money(money.amount, money.currency);
    }

    final key = '${money.currency}->$currency';
    final rate = exchangeRates[key];
    if (rate == null) {
      throw UnsupportedError(key);
    }

    return Money(money.amount * rate, currency);
  }
}
