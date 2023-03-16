import Foundation

protocol Inputable{
    associatedtype input
    var inputValue: input {get set}
    func receiver(_ value: input)
}

protocol InputNumberable: Inputable{
    var inputNumber: numbers {get set}
}

protocol InputOperatorable: Inputable{
    var inputOperator: operators {get set}
}

protocol Formulable{
    var stringNumber: String {get set}
    var stringOperator: String {get set}
    var formula: String {get set}
}

protocol Calculateable{
    var result: String {get set}
    func calculate(_ formula: String) -> Double
    func toString(_ result: Double) -> String
}

protocol Printable{
    var text: String {get set}
    func printText()
}
