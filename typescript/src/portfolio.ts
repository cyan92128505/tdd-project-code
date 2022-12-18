import { Bank } from "./bank";
import Money from "./money";


export class Portfolio {
    moneys: Money[] = [];

    add(money: Money): Portfolio {
        this.moneys.push(money);
        return this;
    }

    evaluate(bank: Bank, currency: string): Money {
        const failures: string[] = [];
        const total = this.moneys.reduce((sum, money) => {
            try {
                const convertedMoney = bank.convert(money, currency);
                return sum + convertedMoney.amount;
            } catch (error) {
                failures.push(`${money.currency}->${currency}`);
                return sum;
            }
        }, 0);

        if (failures.length === 0) {
            return new Money(total, currency);
        }

        throw new Error(`Missing exchange rate(s):[${failures.join()}]`)
    }
}

export default Portfolio;