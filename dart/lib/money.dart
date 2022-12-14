class Dollar {
  int amount;

  Dollar(this.amount);

  Dollar times(int multiplier){
    return new Dollar(multiplier*this.amount);
  }
}


class Money {
  int amount;
  String currency;

  Money(this.amount, this.currency);

  Money times(int multiplier){
    return new Money(multiplier*this.amount, this.currency);
  }

}