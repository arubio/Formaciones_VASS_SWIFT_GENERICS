import Foundation

//: # Caso de estudio: implementar el tipo Nullable, que será un análogo de Optional.

enum Nullable<A> {
  case present(A)
  case null
}

func parseDate(_ timeStamp: String) -> Nullable<Date> {
  if timeStamp == "Friday" { return .present(Date()) }
  else { return .null }
}

parseDate("Monday")
parseDate("Friday")
