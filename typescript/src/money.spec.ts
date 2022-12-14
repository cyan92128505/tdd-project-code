import {
    Dollar,
    Money
} from "./money";

test('5 x 2 = 10', () => {

    const fiver = new Dollar(5);
    const tenner = fiver.times(2);

    expect(tenner.amount).toBe(10);
});

test('10 EUR * 2 = 20 EUR', () => {

    const tenEuros = new Money(10, 'EUR');
    const twentyEuros = tenEuros.times(2);

    expect(twentyEuros.amount).toBe(20);
    expect(twentyEuros.currency).toBe('EUR');
})