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
        const eurToUsd = 1.2;

        if (money.currency === currency) {
            return money.amount;
        }

        return money.amount * eurToUsd;
    }
}

export default Portfolio;