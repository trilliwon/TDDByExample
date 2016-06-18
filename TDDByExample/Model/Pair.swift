//
//  Pair.swift
//  TDDByExample
//
//  Created by Steve Jo on 6/18/16.
//  Copyright © 2016 Steve Jo. All rights reserved.
//

import Foundation

struct Pair: Equatable, Hashable {
  private let from: String
  private let to: String
  
  init(from: String, to: String) {
    self.from = from
    self.to = to
  }
  
  var hashValue: Int = 0
}

func ==(lhs: Pair, rhs: Pair) -> Bool {
  if lhs.from != rhs.from {
    return false
  }
  
  if lhs.to != rhs.to {
    return false
  }
  
  return true
}