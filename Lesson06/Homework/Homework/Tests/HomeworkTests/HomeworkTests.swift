import XCTest
@testable import Homework

class HomeworkTests: XCTestCase {
	func testLazySplitString() {
		let text = "this has 4 words"
		let ranges = text.lazy.split(separator: " ")

		XCTAssertEqual(ranges.prefix(2).map {text[$0]}, ["this", "has"])
		XCTAssertEqual(ranges.map {text[$0]}, ["this", "has", "4", "words"])
	}
}

// use in unit tests
extension String.Index: CustomDebugStringConvertible {
	// The offset into a string’s UTF-16 encoding for this index.
	public var debugDescription: String { return "\(encodedOffset)" }
}
