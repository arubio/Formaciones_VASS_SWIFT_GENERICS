import Foundation

/*:
 
 ## Type contraints (¿limitaciones de tipo? no se me ocurre una traducción mejor)

 Ahora que conocemos la sintaxis necesaria para crear tipos genéricos en nuestras funciones, tipos de datos y protocolos podemos empezar con la *chicha* del tema.
 
 En Swift los tipos genéricos están totalmente ligados a los protocolos. Una de las pruebas que cimientan este concepto es que, como ya hemos dicho antes, **cuando los protocolos son genéricos, solo se pueden usar como limitaciones de tipo** *(por ahora)*.
 
 * Se podrá definir que tu tipo genérico debe conformar a un protocolo tal que así: ```...<A: Protocol>```
 * También se podrá hacer con la keyword ```where```: ```<A>... where A: Protocol```.
 * Incluso podremos limitarlo a un tipo concreto: ```...<A> where A == String```.
 * Esto también aplica a protocolos genéricos, al definir su tipo asociado o extendiendo un protocolo genérico que use ```Self```.
 */


//: ## Limitaciones de tipo en funciones genéricas

func min<T>(_ x: T, _ y: T) -> T where T: Comparable {
  return y < x ? y : x
}

min(1, 2)

//: ## Limitaciones de tipo en protocolos genéricos

protocol Warrior {
  associatedtype Weapon where Weapon: Equatable
  
  var weapon: Weapon { get }
}


//: ## Limitaciones de tipo en tipos de datos

struct Battalion<A: Warrior> where A.Weapon: Hashable {
  let warriors: [A]
}


//: ## Limitaciones de tipo a la hora de extender un tipo genérico

protocol Equatable2 {
  func isEqual(to: Self) -> Bool
}

extension Equatable2 where Self: Equatable {
  func isEqual(to: Self) -> Bool {
    return self == to
  }
}

extension Int: Equatable2 {
  func isEqual(to: Int) -> Bool {
    return self == to
  }
}

extension Array where Element: Equatable2 {
  
  func contains2(_ element: Element) -> Bool {
    for x in self {
      if x.isEqual(to: element) {
        return true
      } else {
        continue
      }
    }
    
    return false
  }
  
}

[1, 2, 3].contains2(10)


//: Y más que se me olvidan ahora probablemente.
