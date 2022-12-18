package tdd

import (
	s "tdd/stocks"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestMultiplication(t *testing.T) {
	actual := s.NewMoney(5, "USD")

	actualResult := actual.Times(2)

	expected := s.NewMoney(10, "USD")

	if expected != actualResult {
		t.Errorf("Expected [%+v], got [%+v]", expected, actualResult)
	}
}

func TestDivision(t *testing.T) {
	actual := s.NewMoney(4002, "KRW")

	actualResult := actual.Divide(4)
	expected := s.NewMoney(1000.5, "KRW")

	if expected != actualResult {
		t.Errorf("Expected %+v Got %+v", expected, actualResult)
	}
}

func TestAddition(t *testing.T) {
	var portfolio s.Portfolio
	var portfolioInDollars s.Money

	fiveDollars := s.NewMoney(5, "USD")
	tenDollars := s.NewMoney(10, "USD")
	fifteenDollars := s.NewMoney(15, "USD")

	portfolio = portfolio.Add(fiveDollars)
	portfolio = portfolio.Add(tenDollars)
	portfolioInDollars = portfolio.Evaluate("USD")

	assert.Equal(t, fifteenDollars, portfolioInDollars, "5 USD Add 10 USD Equal 15 USD")
}

func TestAddtionOfDollarsAndEuros(t *testing.T) {
	var portfolio s.Portfolio

	fiveDollars := s.NewMoney(5, "USD")
	tenEuros := s.NewMoney(10, "EUR")

	portfolio = portfolio.Add(fiveDollars)
	portfolio = portfolio.Add(tenEuros)

	expected := s.NewMoney(17, "USD")
	actual := portfolio.Evaluate("USD")

	assert.Equal(t, expected, actual)
}

func TestAddtionOfDollarsAndWons(t *testing.T) {
	var portfolio s.Portfolio

	oneDollars := s.NewMoney(1, "USD")
	elevenHundredWons := s.NewMoney(1100, "KRW")

	portfolio = portfolio.Add(oneDollars)
	portfolio = portfolio.Add(elevenHundredWons)

	expected := s.NewMoney(2200, "KRW")
	actual := portfolio.Evaluate("KRW")

	assert.Equal(t, expected, actual)
}
