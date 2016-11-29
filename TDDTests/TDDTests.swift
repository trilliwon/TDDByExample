import XCTest
@testable import TDD



class TDDTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func test_Multiplication() {
    var five = Dollar(amount: 5)
    five.times(multiplier: 2)
    XCTAssertEqual(10, five.amount)
  }
}
