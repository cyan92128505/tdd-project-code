package tdd

type Dollar struct {
	amount int
}

func (d Dollar) Times(multiplier int) Dollar {
	return Dollar{amount: d.amount * multiplier}
}

type Money struct {
	amount   int
	currency string
}

func (m Money) Times(multiplier int) Money {
	return Money{amount: m.amount * multiplier, currency: m.currency}
}
