import Foundation

/*:
 
 ## Protocolos genéricos
 
 * Puedes crear protocolos con tipos asociados genéricos. La sintaxis es diferente a la de los tipos de datos, pero a efectos practicos se consiguen cosas similares.
 * Otra forma de conseguir genericidad para un protocolo es referenciar en alguna declaración al tipo ```Self```, que hará referencia al tipo que implementa ese protocolo.
 * **Un protocolo genérico nunca podrá usarse como si fuera un tipo concreto**. Es decir, que los protocolos genéricos solo se pueden usar como *constraints* de tipo para declaraciones genéricas (más sobre esto en el siguiente paso). Probablemente en el futuro Swift levante esta restricción, pero por ahora la implementación de genéricos en Swift es la que es.
 */

protocol Warrior {
  associatedtype Weapon
  
  var weapon: Weapon { get }
}

protocol Pepe: class { // el modificador class hace que el protocolo pueda actuar como tipo concreto
  var string: String { get }
}

struct Army {
   // let warriors: [Warrior] no compila ya que warrior no puede actuar como un tipo concreto
}

struct Battalion<A: Warrior> {
  let warriors: [A] // Compila ya que Warrior solo actúa como type-contraint sobre el tipo concreto A.
}


protocol Equatable2 {
  func isEqual(to: Self) -> Bool
}

extension Int: Equatable2 {
  func isEqual(to: Int) -> Bool {
    return self == to
  }
}


1.isEqual(to: 1)
2.isEqual(to: 2)
