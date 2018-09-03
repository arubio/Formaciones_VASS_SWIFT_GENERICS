import Foundation

/*:
 
 ## Tipos de datos genéricos
 
 * Puedes embeber tipos genéricos tanto en clases como en structs.
 * La sintaxis es similar a muchos otros lenguajes que soportan genéricos, ie: Java, Kotlin, C++, etcétera.
 */

class Container<A> {
  let contained: A
  
  init(_ a: A) {
    contained = a
  }
}

struct Box<A> {
  let contained: A
}

Container("Swift").self
Box(contained: "Swift").self
