//
//  Money.swift
//  TDD
//
//  Created by Steve Jo on 6/18/16.
//  Copyright © 2016 Steve Jo. All rights reserved.
//

import Foundation

protocol Expression {
  func reduce(bank: Bank, to: String) -> Money
  func plus(addend: Expression) -> Expression
}


class Money: Equatable, Expression {
  
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
  
  func times(multiplier: Int) -> Expression {
    return Money(amount: amount * multiplier, currencyString: currencyString)
  }
  
  func plus(addend: Expression) -> Expression {
    return Sum(augend: self, addend: addend)
  }
  
  func reduce(bank: Bank, to: String) -> Money {
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