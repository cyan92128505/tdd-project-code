package tdd

type Money struct {
	amount   int
	currency string
}

func (m Money) Times(multiplier int) Money {
	return Money{amount: m.amount * multiplier, currency: m.currency}
}
