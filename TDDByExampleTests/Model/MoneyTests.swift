
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















