//
//  TDDTests.swift
//  TDDTests
//
//  Created by Steve Jo on 6/18/16.
//  Copyright © 2016 Steve Jo. All rights reserved.
//

import XCTest
@testable import TDDByExample

class DollarTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testMultipleication() {
    let five: Money = Money.dollar(5)
    XCTAssertEqual(Money.dollar(10), five.times(2))
    XCTAssertEqual(Money.dollar(15),five.times(3))
  }
  
  func testEquality() {
    XCTAssertTrue((Money.dollar(5) == Money.dollar(5)))
    XCTAssertFalse(Money.dollar(5) == Money.dollar(4))
    XCTAssertTrue(Money.frenc(5) == Money.frenc(5))
    XCTAssertFalse(Money.frenc(5) == Money.dollar(5))
    XCTAssertFalse(Money.dollar(5) == Money.frenc(5))
  }
  
  func test_WhenAmountDifferes_ShouldBeNotEqual() {
    let five = Dollar(amount: 5)
    let four = Dollar(amount: 4)
    XCTAssertTrue(five != four)
  }
}
