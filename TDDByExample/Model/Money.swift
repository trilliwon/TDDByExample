//
//  Money.swift
//  TDD
//
//  Created by Steve Jo on 6/18/16.
//  Copyright © 2016 Steve Jo. All rights reserved.
//

import Foundation

class Money: Equatable {
  
  internal var amount: Int
  internal var currencyString: String
  
  init(amount: Int, currencyString: String) {
    self.amount = amount
    self.currencyString = currencyString
  }
  
  static func dollar(amount: Int) -> Money {
    return Money(amount: amount, currencyString: "USD")
  }
  
  static func frenc(amount: Int) -> Money {
    return Money(amount: amount, currencyString: "CHF")
  }
  
  func currency() -> String {
    return currencyString
  }
  
  func times(multiplier: Int) -> Money {
    return Money(amount: amount * multiplier, currencyString: currencyString)
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