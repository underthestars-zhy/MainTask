import XCTest
@testable import MainTask

final class MainTaskTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        func hi() async {
            print("hi")
        }
        print(Thread.current)
        MainTask {
            await hi()
            print(Thread.current)
        }
        print(Thread.current)
    }
}
