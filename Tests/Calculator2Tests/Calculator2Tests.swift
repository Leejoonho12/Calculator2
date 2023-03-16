import XCTest
@testable import Calculator2

final class Calculator2Tests: XCTestCase {
    func testExample() throws {
        let instance: Calculator2 = Calculator2()
        instance.operatorSet(.add)
        instance.textNumberSet(.one)
        instance.operatorSet(.add)
        instance.textNumberSet(.two)
        instance.textNumberSet(.dot)
        instance.textNumberSet(.two)
        instance.operatorSet(.min)
        instance.operatorSet(.mul)
        instance.operatorSet(.add)
        instance.textNumberSet(.dot)
        instance.textNumberSet(.two)
        instance.textNumberSet(.dot)
        instance.operatorSet(.mul)
        instance.textNumberSet(.three)
        instance.operatorSet(.add)
        instance.getResult()  // +1+2.2-*+.2.*3+= -> 1+2.2+0.2*3=
//        XCTAssertEqual(instance.text, "9.2")
    }
}
