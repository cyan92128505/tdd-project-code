class Money {
  int amount;
  String currency;

  Money(this.amount, this.currency);

  Money times(int multiplier){
    return new Money(multiplier*this.amount, this.currency);
  }

}