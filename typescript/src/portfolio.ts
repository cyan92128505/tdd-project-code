import Money from "./money";


export class Portfolio {
    moneys: Money[] = [];

    add(money: Money): Portfolio {
        this.moneys.push(money);
        return this;
    }

    evaluate(currency: string): Money {
        const failures: string[] = [];
        const total = this.moneys.reduce((sum, money) => {
            const convertedAmount = this.convert(money, currency);
            if (convertedAmount === 0) {
                failures.push(`${money.currency}->${currency}`);
            }
            return sum + convertedAmount;
        }, 0);

        if (failures.length === 0) {
            return new Money(total, currency);
        }

        throw new Error(`Missing exchange rate(s):[${failures.join()}]`)
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