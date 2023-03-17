import Foundation

class FormulaMaker: InputOperator, Formulable{
    
    var stringNumber: String = String()
    
    var stringOperator: String = String()
    
    var formula: String = String()
    
    var addNumber: String{
        get{
            return self.stringNumber
        }
        set(value){
            stringNumber += value
        }
    }
    
    func printFormula(){
        print(formula)
    }
    
    override init(){
        super.init()
    }
}

struct FormulaMaker2: Formulable{
    
    var stringNumber: String = String()
    
    var stringOperator: String = String()
    
    var formula: String = String()
    
    func addValue(_ value: Any){
        
    }
}

class DoCalculate: FormulaMaker, Calculateable{
    
    var result: String = String()
    
    var doubleNumber: Double = 0.0 {
        didSet{
            doubleNumber = round(doubleNumber * 10000000000) / 10000000000
        }
    }
    
    func calculate(_ formula: String) -> Double{
        var numberArray: [String] = [String]()
        var operatorArray: [String] = [String]()
        var number: String = ""
        for seq in 0 ..< formula.count{
            let index: String.Index = formula.index(formula.startIndex, offsetBy: seq)
            let charactor: Character = formula[index]
            let content: String = String(charactor)
            if content == "-" || content == "+" || content == "*" || content == "/"{
                numberArray.append(number)
                number = ""
                operatorArray.append(content)
            }else if seq == formula.count - 1{
                number += content
                numberArray.append(number)
            }else{
                number += content
            }
        }
        var doubles: [Double] = numberArray.compactMap{Double($0)}
        for seq in 0..<operatorArray.count{
            if operatorArray[seq] == "*"{
                doubles[seq + 1] *= doubles[seq]
                doubles[seq] = 0.0
            } else if operatorArray[seq] == "/"{
                doubles[seq + 1] = doubles[seq] / doubles[seq + 1]
                doubles[seq] = 0.0
            } else if operatorArray[seq] == "-"{
                doubles[seq + 1] = -doubles[seq + 1]
            }
        }
        var result: Double = doubles.reduce(0, {$0 + $1})
        result = round(result * 10000000000) / 10000000000
        return result
    }
    
    func toString(_ result: (String) -> Double) -> String{
        if result(formula).truncatingRemainder(dividingBy: 1) == 0.0{
            return String(Int(result(formula)))
        }else{
            return String(result(formula))
        }
    }
    
    override init(){
        super.init()
    }
}

extension DoCalculate{
    
    func nsCalculate(){
        let ns: NSExpression = NSExpression(format: formula)
        let nsValue: Any? = ns.expressionValue(with: nil, context: nil)
        if let anyResult: Any = nsValue{
            if let result = anyResult as? Double{
                doubleNumber = result
            }
        }
    }
    
    func nsToString(_ result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0.0{
            return String(Int(result))
        }else{
            return String(result)
        }
    }
}

