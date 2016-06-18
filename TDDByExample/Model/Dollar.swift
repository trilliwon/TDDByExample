//
//  Dollar.swift
//  TDD
//
//  Created by Steve Jo on 6/18/16.
//  Copyright © 2016 Steve Jo. All rights reserved.
//

import Foundation

class Dollar: Money {
  override func times(multiplier: Int) -> Money {
    return Dollar(amount: amount * multiplier)
  }
}