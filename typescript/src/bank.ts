import { Money } from './money';
export class Bank {
    exchangeRates: Map<string, number>;

    constructor() {
        this.exchangeRates = new Map();
    }

    addExchangeRate(currencyFrom: string, currencyTo: string, rate: number) {
        const key = `${currencyFrom}->${currencyTo}`;
        this.exchangeRates.set(key, rate);
    }

    convert(money: Money, currency: string): Money {
        if (money.currency === currency) {
            return new Money(money.amount, money.currency);
        }

        const key = `${money.currency}->${currency}`;
        const rate = this.exchangeRates.get(key);

        if (rate === undefined) {
            throw new Error(key);
        }

        return new Money(money.amount * rate, currency);
    }
}