package tdd

import (
	"testing"
)

func TestMultiplicationInDollars(t *testing.T) {
	fiver := Money{
		amount:   5,
		currency: "USD",
	}

	actualResult := fiver.Times(2)
	expectedResult := Money{amount: 10, currency: "USD"}

	if expectedResult != actualResult {
		t.Errorf("Expected [%+v], got [%+v]", expectedResult, actualResult)
	}
}

func TestMultiplicationInEuros(t *testing.T) {
	tenEuros := Money{amount: 10, currency: "EUR"}

	actualResult := tenEuros.Times(2)
	expectedResult := Money{amount: 20, currency: "EUR"}

	if expectedResult != actualResult {
		t.Errorf("Expected [%+v], got [%+v]", expectedResult, actualResult)
	}
}

func TestDivision(t *testing.T) {
	originMoney := Money{amount: 4002, currency: "KRW"}

	actualMoneyAfterDivision := originMoney.Divide(4)
	expectedMoneyAfterDivision := Money{amount: 1000.5, currency: "KRW"}

	if expectedMoneyAfterDivision != actualMoneyAfterDivision {
		t.Errorf("Expected %+v Got %+v", expectedMoneyAfterDivision, actualMoneyAfterDivision)
	}
}
