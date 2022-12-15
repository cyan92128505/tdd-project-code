class Money {
  double amount;
  String currency;

  Money(this.amount, this.currency);

  Money times(double multiplier) {
    return Money(multiplier * amount, currency);
  }

  Money divide(double divisor) {
    return Money(amount / divisor, currency);
  }

  @override
  bool operator ==(other) {
    return (other is Money) &&
        other.amount == amount &&
        other.currency == currency;
  }

  @override
  int get hashCode => amount.hashCode ^ currency.hashCode;
}
