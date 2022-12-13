import unittest


class TestMoney(unittest.TestCase):
    def testMultiplication(self):
        fiver = Doller(5)
        tenner = fiver.times(2)
        self.assertEqual(10, tenner.amount)


if __name__ == '__main__':
    unittest.main()
