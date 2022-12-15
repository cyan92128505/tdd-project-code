package tdd

import (
	"testing"
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
