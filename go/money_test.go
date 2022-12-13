package main

import (
	"testing"
)

func TestMultiplication(t *testing.T) {
	fiver := Doller{
		amount: 5,
	}

	tenner := fiver.Timer(2)
	if tenner.amount != 10 {
		t.Errorf("Expected 10, got:[%d]", tenner.amount)
	}
}
