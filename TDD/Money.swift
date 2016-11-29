import Foundation



struct Dollar {
  var amount:Int
  
  mutating func times(multiplier: Int) {
    self.amount *= multiplier
  }
}
