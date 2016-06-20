//
//  Sum.swift
//  TDDByExample
//
//  Created by Steve Jo on 6/18/16.
//  Copyright © 2016 Steve Jo. All rights reserved.
//

import Foundation

struct Sum: Expression {
  let augend: Expression
  let addend: Expression
  
  func reduce(bank: Bank, to: String) -> Money {
    let amount = augend.reduce(bank, to: to).amount + addend.reduce(bank, to: to).amount
    return Money(amount: amount, currencyString: to)
  }
  
  func plus(addend: Expression) -> Expression {
    return Sum(augend: self, addend: addend)
  }
  
  func times(multiplier: Int) -> Expression {
    return Sum(augend: addend.times(multiplier), addend: addend.times(multiplier))
  }
}