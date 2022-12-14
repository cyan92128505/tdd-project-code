class Dollar {
  int amount;

  Dollar(this.amount);

  Dollar times(int multiplier){
    return new Dollar(multiplier*this.amount);
  }
}