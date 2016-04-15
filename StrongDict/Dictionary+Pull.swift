import Foundation

extension Dictionary where Key : Hashable {
  
  func pull<T>(key: Key) -> T {
    return self[key] as! T
  }
  
  func pullOptional<T>(key: Key) -> T? {
    return self[key] as? T
  }
  
}
