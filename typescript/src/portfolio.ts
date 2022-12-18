import Money from "./money";


export class Portfolio {
    moneys: Money[] = [];

    add(money: Money): Portfolio {
        this.moneys.push(money);
        return this;
    }

    evaluate(currency: string): Money {
        const total = this.moneys.reduce((sum, money) => sum + money.amount, 0);

        return new Money(total, currency);
    }
}

export default Portfolio;