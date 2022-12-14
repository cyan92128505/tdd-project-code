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

}
