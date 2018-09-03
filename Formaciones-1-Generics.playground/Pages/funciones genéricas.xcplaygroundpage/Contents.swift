import Foundation

/*:
 
 ## Funciones genéricas
 
 * Se definen de la misma forma que siempre, pero antes de darle parámetros a la función o método, se declararán los tipos genéricos para su contexto. Ejemplo:
 */

func createArray<Element>(of type: Element.Type) -> [Element] {
  return Array<Element>()
}

type(of:
  createArray(of: Int.self)
)
