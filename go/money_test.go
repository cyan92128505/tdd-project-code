package tdd

import (
	s "tdd/stocks"
	"testing"

	"github.com/stretchr/testify/assert"
)

var bank s.Bank

func initExchangeRates() {
	bank = s.NewBank()
	bank.AddExchangeRate("EUR", "USD", 1.2)
	bank.AddExchangeRate("USD", "KRW", 1100)
}

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
	initExchangeRates()
	var portfolio s.Portfolio
	var portfolioInDollars *s.Money

	fiveDollars := s.NewMoney(5, "USD")
	tenDollars := s.NewMoney(10, "USD")
	fifteenDollars := s.NewMoney(15, "USD")

	portfolio = portfolio.Add(fiveDollars)
	portfolio = portfolio.Add(tenDollars)
	portfolioInDollars, _ = portfolio.Evaluate(bank, "USD")

	assert.Equal(t, fifteenDollars, *portfolioInDollars, "5 USD Add 10 USD Equal 15 USD")
}

func TestAddtionOfDollarsAndEuros(t *testing.T) {
	initExchangeRates()
	var portfolio s.Portfolio

	fiveDollars := s.NewMoney(5, "USD")
	tenEuros := s.NewMoney(10, "EUR")

	portfolio = portfolio.Add(fiveDollars)
	portfolio = portfolio.Add(tenEuros)

	expected := s.NewMoney(17, "USD")
	actual, _ := portfolio.Evaluate(bank, "USD")

	assert.Equal(t, expected, *actual)
}

func TestAddtionOfDollarsAndWons(t *testing.T) {
	initExchangeRates()
	var portfolio s.Portfolio

	oneDollars := s.NewMoney(1, "USD")
	elevenHundredWons := s.NewMoney(1100, "KRW")

	portfolio = portfolio.Add(oneDollars)
	portfolio = portfolio.Add(elevenHundredWons)

	expected := s.NewMoney(2200, "KRW")
	actual, _ := portfolio.Evaluate(bank, "KRW")

	assert.Equal(t, expected, *actual)
}

func TestAdditionWithMultipleMissingExchangeRates(t *testing.T) {
	initExchangeRates()
	var portfolio s.Portfolio

	oneDollars := s.NewMoney(1, "USD")
	oneEuros := s.NewMoney(1, "EUR")
	oneWon := s.NewMoney(1, "KRW")

	portfolio = portfolio.Add(oneDollars)
	portfolio = portfolio.Add(oneEuros)
	portfolio = portfolio.Add(oneWon)

	expected := "Missing exchange rate(s):[USD->Kalganid,EUR->Kalganid,KRW->Kalganid,]"
	_, actualError := portfolio.Evaluate(bank, "Kalganid")
	actual := actualError.Error()

	assert.Equal(t, expected, actual)
}

func TestConversion(t *testing.T) {
	bank := s.NewBank()
	bank.AddExchangeRate("EUR", "USD", 1.2)
	tenEuros := s.NewMoney(10, "EUR")
	expected := s.NewMoney(12, "USD")

	actual, err := bank.Convert(tenEuros, "USD")
	assert.Nil(t, err)
	assert.Equal(t, expected, *actual)
}

func TestConcversionWithMissingExchangeRate(t *testing.T) {
	bank := s.NewBank()
	tenEuros := s.NewMoney(10, "EUR")
	actual, err := bank.Convert(tenEuros, "Kalganid")
	if actual != nil {
		t.Errorf("Expected Money to be nil, found: [%+v]", actual)
	}

	assert.Equal(t, "EUR->Kalganid", err.Error())
}
