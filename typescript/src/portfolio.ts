import Money from "./money";


export class Portfolio {
    moneys: Money[] = [];

    add(money: Money): Portfolio {
        this.moneys.push(money);
        return this;
    }

    evaluate(currency: string): Money {
        const total = this.moneys.reduce((sum, money) => sum + this.convert(money, currency), 0);

        return new Money(total, currency);
    }

    convert(money: Money, currency: string): number {
        const exchangeRates = new Map();
        exchangeRates.set("EUR->USD", 1.2);
        exchangeRates.set("USD->KRW", 1100);

        if (money.currency === currency) {
            return money.amount;
        }

        const key = `${money.currency}->${currency}`
        const rate = exchangeRates.get(key) || 0;

        return money.amount * rate;
    }
}

export default Portfolio;