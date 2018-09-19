
import XCTest
import CollectionsExtra

class SetTests: XCTestCase {
	func testRemoveDuplicates() {
		XCTAssertEqual([1,2,3,2,2,3,1,3,2].removeDuplicates(), [1,2,3])
		XCTAssertEqual([1,1,2,1,1,2,3,2,2,2,3,1,3,2].removeDuplicates(), [1,2,3])
		XCTAssertEqual(Array<Bool>().removeDuplicates(), [])
		XCTAssertEqual([1].removeDuplicates(), [1])
		XCTAssertEqual([1,1,1,1,1,1].removeDuplicates(), [1])
	}
}
