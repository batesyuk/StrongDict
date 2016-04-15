import Foundation

struct Person {
  
  let dictionary: [String :AnyObject]
  
  init(dictionary: [String :AnyObject]) {
    self.dictionary = dictionary
  }
  
  subscript(property: Variable) -> String? {
    return self.dictionary.pullOptional(property.rawValue)
  }

  subscript(property: Variable) -> Int? {
    return self.dictionary.pullOptional(property.rawValue)
  }

  enum Variable: String {
    case name
    case age
  }
  
}

extension Dictionary where Key : Hashable {
  
  func pull<T>(key: Key) -> T {
    return self[key] as! T
  }
  
  func pullOptional<T>(key: Key) -> T? {
    return self[key] as? T
  }
  
}
