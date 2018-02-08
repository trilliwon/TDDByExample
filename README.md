# TDDByExample
Swift TDD: By Example

---

### Money.swift
```Swift
import Foundation

protocol Expression {
  func reduce(_ bank: Bank, to: String) -> Money
  func plus(_ addend: Expression) -> Expression
  func times(_ multiplier: Int) -> Expression
}


class Money: Equatable, Expression {
  
  internal var amount: Int
  internal var currencyString: String
  
  init(amount: Int, currencyString: String) {
    self.amount = amount
    self.currencyString = currencyString
  }
  
  
  static func dollar(_ amount: Int) -> Money {
    return Money(amount: amount, currencyString: "USD")
  }
  
  static func frenc(_ amount: Int) -> Money {
    return Money(amount: amount, currencyString: "CHF")
  }
  
  func currency() -> String {
    return currencyString
  }
  
  func times(_ multiplier: Int) -> Expression {
    return Money(amount: amount * multiplier, currencyString: currencyString)
  }
  
  func plus(_ addend: Expression) -> Expression {
    return Sum(augend: self, addend: addend)
  }
  
  func reduce(_ bank: Bank, to: String) -> Money {
    let rate = bank.rate(currency(), to: to)
    return Money(amount: amount / rate, currencyString: to)
  }
}

func ==(lhs: Money, rhs: Money) -> Bool {
  
  if lhs.amount != rhs.amount {
    return false
  }
  
  if lhs.currencyString != rhs.currencyString {
    return false
  }
  
  return true
}

```

---

### MoneyTests.swift
```Swift
import XCTest
@testable import TDDByExample

class MoneyTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func test_Multiplication() {
    let five: Money = Money.dollar(5)
    let ten = five.times(2) as! Money
    let fifteen = five.times(3) as! Money
    XCTAssertEqual(Money.dollar(10), ten)
    XCTAssertEqual(Money.dollar(15), fifteen)
  }
  
  func test_Currency() {
    XCTAssertEqual("USD", Money.dollar(1).currency())
    XCTAssertEqual("CHF", Money.frenc(1).currency())
  }
  
  
  func test_Equality() {
    XCTAssertTrue((Money.dollar(5) == Money.dollar(5)))
    XCTAssertFalse(Money.dollar(5) == Money.dollar(6))
    XCTAssertFalse(Money.dollar(5) == Money.frenc(5))
  }
  
  func test_SimpleAddition() {
    let five = Money.dollar(5)
    let sum: Expression = five.plus(five)
    let bank = Bank()
    let reduced = bank.reduce(sum, to: "USD")
    XCTAssertEqual(Money.dollar(10), reduced)
  }
  
  func test_PlusReturnsSum() {
    let five = Money.dollar(5)
    let result = five.plus(five)
    let sum: Sum = result as! Sum
    
    let augend = sum.augend as! Money
    let addend = sum.addend as! Money
    XCTAssertEqual(five, augend)
    XCTAssertEqual(five, addend)
  }
  
  func test_ReduceSum() {
    let sum = Sum(augend: Money.dollar(3), addend: Money.dollar(4))
    let bank = Bank()
    let result = bank.reduce(sum, to: "USD")
    XCTAssertEqual(Money.dollar(7), result)
  }
  
  func test_ReduceMoney() {
    let bank = Bank()
    let result = bank.reduce(Money.dollar(1), to: "USD")
    XCTAssertEqual(Money.dollar(1), result)
  }
  
  func test_ReduceMoneyDifferentCurrency() {
    let bank = Bank()
    bank.addRate("CHF", to: "USD", rate: 2)
    let result = bank.reduce(Money.frenc(2), to: "USD")
    XCTAssertEqual(Money.dollar(1), result)
  }
  
  func test_IdentityRate() {
    XCTAssertEqual(1, Bank().rate("USD", to: "USD"))
  }
  
  func test_MixedAddtion() {
    let fiveBucks: Expression = Money.dollar(5)
    let tenFrances: Expression = Money.frenc(10)
    let bank = Bank()
    bank.addRate("CHF", to: "USD", rate: 2)
    let result: Money = bank.reduce(fiveBucks.plus(tenFrances), to: "USD")
    XCTAssertEqual(Money.dollar(10), result)
  }
  
  func test_SumPlusMoney() {
    let fiveBucks: Expression = Money.dollar(5)
    let tenFrances: Expression = Money.frenc(10)
    let bank = Bank()
    bank.addRate("CHF", to: "USD", rate: 2)
    let sum: Expression = Sum(augend: fiveBucks, addend: tenFrances).plus(fiveBucks)
    let result: Money = bank.reduce(sum, to: "USD")
    XCTAssertEqual(Money.dollar(15), result)
  }
  
  func test_SumTimes() {
    let fiveBucks: Expression = Money.dollar(5)
    let tenFrances: Expression = Money.frenc(10)
    let bank = Bank()
    bank.addRate("CHF", to: "USD", rate: 2)
    let sum: Expression = Sum(augend: fiveBucks, addend: tenFrances).times(2)
    let result: Money = bank.reduce(sum, to: "USD")
    XCTAssertEqual(Money.dollar(20), result)
  }
}
```
