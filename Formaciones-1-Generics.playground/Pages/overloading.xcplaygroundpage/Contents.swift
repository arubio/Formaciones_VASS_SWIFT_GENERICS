import Foundation
/*:
 
 ## Primero, overloading en funciones.
 * Multiples funciones que tienen el mismo nombre, pero diferentes tipos de argumentos o parámetros de retorno.
 * No es exactamente lo mismo que programar con genéricos pero, al igual que los genéricos, nos permite habilitar una única interfaz para multiples tipos.
 
 ## Overloading en funciones simples:
 */
func power(of value: Int, to power: Int) -> Int {
  return Int(pow(Double(value), Double(power)))
}

func power(of value: Double, to power: Double) -> Double {
  return pow(value, power)
}

func power(of value: Float, to power: Float) -> Float {
  return powf(value, power)
}

type(of:
  power(of: 5, to: 2)
)

let double = power(of: 5.0, to: 2.0)
type(of: double)

let float: Float = power(of: 5.0, to: 2.0)
type(of: float)


/*:
 
 ## ¿Pero cómo sabe el compilador qué overload usar?
 
 * Reglas muy complejas, pero que se resumen con: **elige el overload más específico**.
 * Es importante recodar que esta elección se realiza por parte del compilador en **tiempo de compilación**.
 * Si se necesitas este polimorfismo en tiempo de ejecución, hay que usar métodos.
 * Todo esto nos dice que si existe una función genérica a la vez que un overload de esta función con tipos concretos, el compilador va a elegir la función de tipos concretos.
 */


func id<A>(_ v: A) -> A {
  print("Generic id called for \(type(of: A.self))")

  return v
}

func id(_ v: Int) -> Int {
  print("Specialized id called for Int")
  
  return v
}


let one = id(1)
let string = id("One")
