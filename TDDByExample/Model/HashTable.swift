public struct HashTable<Key: Hashable, Value> {
  private typealias Element = (key: Key, value: Value)
  private typealias Bucket = [Element]
  
  private var buckets: [Bucket]
  private(set) var count = 0
  
  public init(capacity: Int) {
    assert(capacity > 0)
    buckets = .init(count: capacity, repeatedValue: [])
  }
  
  public var isEmpty: Bool {
    return count == 0
  }
  
  private func indexForKey(key: Key) -> Int {
    return abs(key.hashValue) % buckets.count
  }
}

// MARK: - Basic operations

extension HashTable {
  public subscript(key: Key) -> Value? {
    get {
      return valueForKey(key)
    }
    set {
      if let value = newValue {
        updateValue(value, forKey: key)
      } else {
        removeValueForKey(key)
      }
    }
  }
  
  public func valueForKey(key: Key) -> Value? {
    let index = indexForKey(key)
    
    for element in buckets[index] {
      if element.key == key {
        return element.value
      }
    }
    return nil  // key not in hash table
  }
  
  public mutating func updateValue(value: Value, forKey key: Key) -> Value? {
    let index = indexForKey(key)
    
    // Do we already have this key in the bucket?
    for (i, element) in buckets[index].enumerate() {
      if element.key == key {
        let oldValue = element.value
        buckets[index][i].value = value
        return oldValue
      }
    }
    
    // This key isn't in the bucket yet; add it to the chain.
    buckets[index].append((key: key, value: value))
    count += 1
    return nil
  }
  
  public mutating func removeValueForKey(key: Key) -> Value? {
    let index = indexForKey(key)
    
    // Find the element in the bucket's chain and remove it.
    for (i, element) in buckets[index].enumerate() {
      if element.key == key {
        buckets[index].removeAtIndex(i)
        count -= 1
        return element.value
      }
    }
    return nil  // key not in hash table
  }
  
  public mutating func removeAll() {
    buckets = .init(count: buckets.count, repeatedValue: [])
    count = 0
  }
}

// MARK: - Helper methods for inspecting the hash table

extension HashTable {
  public var keys: [Key] {
    var a = [Key]()
    for bucket in buckets {
      for element in bucket {
        a.append(element.key)
      }
    }
    return a
  }
  
  public var values: [Value] {
    var a = [Value]()
    for bucket in buckets {
      for element in bucket {
        a.append(element.value)
      }
    }
    return a
  }
}

// MARK: - For debugging

extension HashTable: CustomStringConvertible {
  public var description: String {
    return buckets.flatMap { b in b.map { e in "\(e.key) = \(e.value)" } }.joinWithSeparator(", ")
  }
}

extension HashTable: CustomDebugStringConvertible {
  public var debugDescription: String {
    var s = ""
    for (i, bucket) in buckets.enumerate() {
      s += "bucket \(i): " + bucket.map { e in "\(e.key) = \(e.value)" }.joinWithSeparator(", ") + "\n"
    }
    return s
  }
}