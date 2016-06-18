//
//  Money.swift
//  TDD
//
//  Created by Steve Jo on 6/18/16.
//  Copyright © 2016 Steve Jo. All rights reserved.
//

import Foundation

class Money: Equatable {
  internal let amount: Int
  
  init(amount: Int) {
    self.amount = amount
  }
  
  static func dollar(amount: Int) -> Money {
    return Dollar(amount: amount)
  }
  
  static func frenc(amount: Int) -> Money {
    return Frenc(amount: amount)
  }
  
  func times(multiplier: Int) -> Money {
    fatalError("Implement me!")
  }
}

func ==(lhs: Money, rhs: Money) -> Bool {
  
  if lhs.amount != rhs.amount {
    return false
  }

  if lhs is Frenc && rhs is Dollar {
    return false
  }
  
  if lhs is Dollar && rhs is Frenc {
    return false
  }
  
  return true
}