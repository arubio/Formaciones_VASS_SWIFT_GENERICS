import Foundation
//: # Caso de estudio: composición de funciones.

infix operator |>: AdditionPrecedence
func |> <A, B>(_ a: A, _ transform: @escaping (A) -> B) -> B {
  return transform(a)
}

infix operator <<<: MultiplicationPrecedence
func <<< <A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
  return { g(f($0)) }
}

func increment(_ x: Int) -> Int {
  return x + 1
}

 1 |> increment <<< String.init <<< Double.init
