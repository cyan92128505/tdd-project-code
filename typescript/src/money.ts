export class Money {
    amount: number;
    currency: string;

    constructor(amount: number, currency: string) {
        this.amount = amount;
        this.currency = currency;
    }

    times(multiplier: number): Money {
        return new Money(this.amount * multiplier, this.currency);
    }

    divide(divisor: number): Money {
        return new Money(this.amount / divisor, this.currency);
    }
}


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