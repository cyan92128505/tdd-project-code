class Money:
    def __init__(self, amount, currency) -> None:
        self.amount = amount
        self.currency = currency

    def times(self, multiplier):
        return Money(self.amount * multiplier, self.currency)
