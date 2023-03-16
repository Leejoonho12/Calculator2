import Foundation

enum startState{ // 처음에 연산자가 오면 안되기 때문에 처음인지 아닌지 나누기 위해
    case willStart
    case didStart
}

enum receiveState{ // 중복적으로 입력된 연산자를 마지막으로 입력된 연산자로 적용 시켜주기 위해, 연산자를 입력하면 그 전에 입력해놓은 숫자를 연산식에 저장하기 위해
    case adding
    case operating
}

enum numberState{ // .이 중복입력되는걸 방지하기 위해
    case int
    case double
}

enum calculateState{ // 곱하기나누기가 포함된 식에 더하기빼기를 입력받았을때 연산값이 출력되는 것을 방지하기 위해
    case onlyAdd
    case mix
}
