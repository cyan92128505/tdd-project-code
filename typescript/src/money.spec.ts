import {
    Money
} from "./money";

test('5 x 2 = 10', () => {

    const actual = new Money(5, 'USD');
    const expected = new Money(10, 'USD');

    expect(actual.times(2)).toEqual(expected);
});

test('10 EUR * 2 = 20 EUR', () => {

    const actual = new Money(10, 'EUR');
    const expected = new Money(20, 'EUR');

    expect(actual.times(2)).toEqual(expected);
})

test('4002 KRW / 4 = 1000.5 KRW', () => {
    const actual = new Money(4002, 'KRW');
    const expected = new Money(1000.5, 'KRW');

    expect(actual.divide(4)).toEqual(expected);
})