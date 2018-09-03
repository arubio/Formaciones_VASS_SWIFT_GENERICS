import Foundation

/*:
 
 # Genéricos en **Swift**
 
 (en Kotlin no, que no hay tiempo)
 
 
 # Qué es.
 
 * El código genérico nos permite escribir funciones y tipos reusables que funcionen con bajo el paraguas de limitaciones que hayamos definido.
 * El objetivo de la programación con genéricos es expresar la mínima interfaz que un algoritmo o estructura de datos requiere.
 * En combinación con protocolos, es una de las herramientas más potentes de Swift.
 */


func identity<A>(of value: A) -> A {
  return value
}

identity(of: "Swift")
identity(of: 1)

