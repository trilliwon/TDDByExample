//
//  Dollar.swift
//  TDD
//
//  Created by Steve Jo on 6/18/16.
//  Copyright © 2016 Steve Jo. All rights reserved.
//

import Foundation

class Dollar: Money {
  
  override init(amount: Int, currencyString: String) {
    super.init(amount: amount, currencyString: currencyString)
  }
  
  override func times(multiplier: Int) -> Money {
    return Money.dollar(amount * multiplier)
  }
}