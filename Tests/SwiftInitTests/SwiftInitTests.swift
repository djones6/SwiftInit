import XCTest
import class Foundation.Bundle
import Application
import SwiftInit

final class SwiftInitTests: XCTestCase {

    func testFruit() throws {
        let apple = Apple(apple: "Apple")
        let banana = Banana(banana: "Banana")
        print(apple)
        print(banana)
    }

    static var allTests = [
        ("testFruit", testFruit),
    ]
}
