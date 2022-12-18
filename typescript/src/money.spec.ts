import Money from "./money";
import Portfolio from "./portfolio";

test('TestMultiplication', () => {
    const actual = new Money(5, 'USD');
    const expected = new Money(10, 'USD');

    expect(actual.times(2)).toEqual(expected);
});


test('TestDivision', () => {
    const actual = new Money(4002, 'KRW');
    const expected = new Money(1000.5, 'KRW');

    expect(actual.divide(4)).toEqual(expected);
})

test('TestAddtion', () => {
    const portfolio = new Portfolio();

    const fiveDollars = new Money(5, "USD");
    const tenDollars = new Money(10, "USD");
    const fifteenDollars = new Money(15, "USD");

    portfolio.add(fiveDollars);
    portfolio.add(tenDollars);

    expect(portfolio.evaluate("USD")).toEqual(fifteenDollars);
})