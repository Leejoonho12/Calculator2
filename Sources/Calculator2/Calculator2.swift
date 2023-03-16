final class Calculator2: DoCalculate, Printable{
    var text: String = String()
    
    func printText(){
        print(text)
    }
    
    override init(){
        super.init()
    }
}

extension Calculator2{
    
    func textNumberSet(_ value: numbers){ // 숫자 받아서 저장하고 출력하는 메서드
        if inputState == .operating{
            if stringOperator == "*" || stringOperator == "/"{
                calState = .mix
            }
            formula += stringOperator
            stringNumber = ""
            numState = .int
        }
        if value == .dot{
            if stringNumber == ""{
                stringNumber += "0"
            }
            if numState == .double{
                printText()
                return
            }
            numState = .double
        }
        receiveNumber(value)
        addNumber = String(inputValue)
        text = stringNumber
        printText()
    }
    
    func operatorSet(_ value: operators){ // 연산자 받아서 저장하고 출력하는 메서드
        if stState == .willStart{
            formula += "0"
        }
        if inputValue == "."{
            stringNumber += "0"
        }
        if inputState == .adding{
            formula += stringNumber
            stringOperator = ""
        }
        receiveOperator(value)
        stringOperator = operatorValue
        if value == .add || value == .min{
            if calState == .onlyAdd{
                nsCalculate()
                result = nsToString(doubleNumber)
                text = result
            }else{
                text = stringNumber
            }
        }
        else{
            text = stringNumber
        }
        printText()
    }
    
    func getResult(){ // 전체 연산결과 출력하는 메서드
        if inputState == .adding{
            formula += stringNumber
        }
        print(formula)
//        nsCalculate()
//        result = nsToString(doubleNumber)
        result = toString(calculate)
        text = result
        printText()
    }
}
