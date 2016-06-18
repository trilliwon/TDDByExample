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
  
  func testCurrency() {
    XCTAssertEqual("USD", Money.dollar(1).currency())
    XCTAssertEqual("CHF", Money.frenc(1).currency())
  }
  
  func testDifferenctClassEquality() {
    XCTAssertTrue(Money(amount: 10, currencyString: "CHF") == Frenc(amount: 10, currencyString: "CHF"))
  }
}