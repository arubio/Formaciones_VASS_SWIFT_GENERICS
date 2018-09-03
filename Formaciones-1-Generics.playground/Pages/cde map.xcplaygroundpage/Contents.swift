import Foundation

//: # Caso de estudio: implementar map sobre Array y sobre Opcional.
extension Array {
  func map2<B>(_ transform: @escaping (Element) -> B) -> [B] {
    var newArray = [B]()
    
    for item in self {
      newArray.append(
        transform(item)
      )
    }
    
    return newArray
  }
}

enum Nullable<A> {
  case present(A)
  case null
}

extension Nullable {
  func map2<B>(_ tranform: @escaping (A) -> B) -> Nullable<B> {
    switch self {
    case let .present(item):
        return .present(tranform(item))
    case .null:
      return .null
    }
  }
}

let a = Nullable.present(1)
let b = a.map2(String.init)

