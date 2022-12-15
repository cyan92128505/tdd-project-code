import functools
import operator


class Money:
    def __init__(self, amount, currency) -> None:
        self.amount = amount
        self.currency = currency

    def __eq__(self, __o: object) -> bool:
        return self.amount == __o.amount and self.currency == __o.currency

    def times(self, multiplier):
        return Money(self.amount * multiplier, self.currency)

    def divide(self, divisor):
        return Money(self.amount / divisor, self.currency)


class Portfolio:
    def __init__(self) -> None:
        self.moneys = []

    def add(self, *moneys):
        self.moneys.extend(moneys)

    def evaluate(self, currency):
        total = functools.reduce(operator.add, map(
            lambda m: m.amount, self.moneys), 0)
        return Money(total, currency)
