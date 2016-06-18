//
//  TDDTests.swift
//  TDDTests
//
//  Created by Steve Jo on 6/18/16.
//  Copyright © 2016 Steve Jo. All rights reserved.
//

import XCTest
@testable import TDDByExample

class FrencTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testFrencMultipleication() {
    let five = Frenc(amount: 5)
    XCTAssertEqual(Frenc(amount: 10), five.times(2))
    XCTAssertEqual(Frenc(amount: 15),five.times(3))
  }
}