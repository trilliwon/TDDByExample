//
//  MoneyTests.swift
//  TDDByExample
//
//  Created by Steve Jo on 6/18/16.
//  Copyright © 2016 Steve Jo. All rights reserved.
//

import XCTest
@testable import TDDByExample

class MoneyTests: XCTestCase {
  
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
  
  func testCurrency() {
    XCTAssertEqual("USD", Money.dollar(1).currency())
    XCTAssertEqual("CHF", Money.frenc(1).currency())
  }
  
  
  func testEquality() {
    XCTAssertTrue((Money.dollar(5) == Money.dollar(5)))
    XCTAssertFalse(Money.dollar(5) == Money.dollar(6))
    XCTAssertFalse(Money.dollar(5) == Money.frenc(5))
  }
}