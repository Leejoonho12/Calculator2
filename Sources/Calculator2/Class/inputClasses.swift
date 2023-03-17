import Foundation

class ColletState{
    var stState: startState = .willStart
    var inputState: receiveState = .adding
    var numState: numberState = .int
    var calState: calculateState = .onlyAdd
    init(){}
}

class Inputer: ColletState, Inputable{
    
    var inputValue: Any = ""
    
    func receiver<T>(_ value: T) {
        inputValue = value
    }
    
    override init(){
        super.init()
    }
}



class InputNumber: ColletState, InputNumberable{
    
    var inputValue: String = String()
    
    var inputNumber: numbers = numbers.zero
    
    func receiver<T>(_ value: T){
    }
    
    func receiveNumber(_ value: numbers){
        inputNumber = value
        inputValue = inputNumber.rawValue
    }
    
    override init(){
        super.init()
    }
}

class InputOperator: InputNumber, InputOperatorable{
    
    var operatorValue: String = String()
    
    var inputOperator: operators = operators.add
    
    func receiveOperator(_ value: operators){
        inputOperator = value
        operatorValue = inputOperator.rawValue
    }
    
    override init(){
        super.init()
    }
}
