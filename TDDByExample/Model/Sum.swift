import Foundation

struct Sum: Expression {
  let augend: Expression
  let addend: Expression
  
  func reduce(_ bank: Bank, to: String) -> Money {
    let amount = augend.reduce(bank, to: to).amount + addend.reduce(bank, to: to).amount
    return Money(amount: amount, currencyString: to)
  }
  
  func plus(_ addend: Expression) -> Expression {
    return Sum(augend: self, addend: addend)
  }
  
  func times(_ multiplier: Int) -> Expression {
    return Sum(augend: addend.times(multiplier), addend: addend.times(multiplier))
  }
}
