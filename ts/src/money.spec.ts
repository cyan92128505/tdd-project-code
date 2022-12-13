import Dollar from "./money";

test('5 x 2 = 10', () => {

    const fiver = new Dollar(5);
    const tenner = fiver.times(2);

    expect(tenner.amount).toBe(10);
});