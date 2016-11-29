import Foundation

struct Pair: Equatable, Hashable {
  fileprivate let from: String
  fileprivate let to: String
  
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
