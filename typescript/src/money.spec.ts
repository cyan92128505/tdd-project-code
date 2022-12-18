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
});

test('TestAddtion', () => {
    const portfolio = new Portfolio();

    const fiveDollars = new Money(5, "USD");
    const tenDollars = new Money(10, "USD");

    portfolio.add(fiveDollars);
    portfolio.add(tenDollars);

    const expacted = new Money(15, "USD");
    const actual = portfolio.evaluate("USD");

    expect(actual).toEqual(expacted);
});

test('TestAddtionOfDollarsAndEuros', () => {
    const portfolio = new Portfolio();

    const fiveDollars = new Money(5, "USD");
    const tenEuros = new Money(10, "EUR");

    portfolio.add(fiveDollars);
    portfolio.add(tenEuros);

    const expacted = new Money(17, "USD");
    const actual = portfolio.evaluate("USD");

    expect(actual).toEqual(expacted);
});

test('TestAddtionOfDollarsAndWons', () => {
    const portfolio = new Portfolio();

    const oneDollars = new Money(1, "USD");
    const elevenHundredWons = new Money(1100, "KRW");

    portfolio.add(oneDollars);
    portfolio.add(elevenHundredWons);

    const expacted = new Money(2200, "KRW");
    const actual = portfolio.evaluate("KRW");

    expect(actual).toEqual(expacted);
});

test('TestAdditionWithMultipleMissingExchangeRates', () => {
    const expected = new Error("Missing exchange rate(s):[USD->Kalganid,EUR->Kalganid,KRW->Kalganid]");
    expect(() => {
        const portfolio = new Portfolio();

        const oneDollars = new Money(1, "USD");
        const oneEuros = new Money(1, "EUR");
        const oneWon = new Money(1, "KRW");

        portfolio.add(oneDollars);
        portfolio.add(oneEuros);
        portfolio.add(oneWon);

        portfolio.evaluate("Kalganid");
    }).toThrow(expected);
});
