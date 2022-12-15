package tdd

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestMultiplicationInDollars(t *testing.T) {
	actual := Money{
		amount:   5,
		currency: "USD",
	}

	actualResult := actual.Times(2)

	expected := Money{amount: 10, currency: "USD"}

	if expected != actualResult {
		t.Errorf("Expected [%+v], got [%+v]", expected, actualResult)
	}
}

func TestMultiplicationInEuros(t *testing.T) {
	actual := Money{amount: 10, currency: "EUR"}

	actualResult := actual.Times(2)
	expected := Money{amount: 20, currency: "EUR"}

	if expected != actualResult {
		t.Errorf("Expected [%+v], got [%+v]", expected, actualResult)
	}
}

func TestDivision(t *testing.T) {
	actual := Money{amount: 4002, currency: "KRW"}

	actualResult := actual.Divide(4)
	expected := Money{amount: 1000.5, currency: "KRW"}

	if expected != actualResult {
		t.Errorf("Expected %+v Got %+v", expected, actualResult)
	}
}

func TestAddition(t *testing.T) {
	var portfolio Portfolio
	var portfolioInDollars Money

	fiveDollars := Money{amount: 5, currency: "USD"}
	tenDollars := Money{amount: 10, currency: "USD"}
	fifteenDollars := Money{amount: 15, currency: "USD"}

	portfolio = portfolio.Add(fiveDollars)
	portfolio = portfolio.Add(tenDollars)
	portfolioInDollars = portfolio.Evaluate("USD")

	assert.Equal(t, fifteenDollars, portfolioInDollars, "5 USD Add 10 USD Equal 15 USD")
}
