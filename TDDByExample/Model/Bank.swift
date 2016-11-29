
import Foundation

class Bank {
  
  var rates = HashTable<Pair, Int>(capacity: 10)
  
  func reduce(_ source: Expression, to: String) -> Money {
    return source.reduce(self, to: to)
  }
  
  func rate(_ from: String, to: String) -> Int {
    if from == to { return 1 }
    
    let rate: Int = rates.valueForKey(Pair(from: from, to: to))!
    return rate
  }
  
  func addRate(_ from: String, to: String, rate: Int) {
    rates[Pair(from: from, to: to)] = rate
  }
}
