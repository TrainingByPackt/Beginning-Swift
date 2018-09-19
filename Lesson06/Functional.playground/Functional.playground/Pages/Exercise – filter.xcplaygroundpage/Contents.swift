
extension String {
	/// The indices of all the occurrences of `character`.
	public func indices(of character: Character) -> [Index] {
		var result = [Index]()
		var i = startIndex
		while i < endIndex {
			if self[i] == character {
				result.append(i)
			}
			i = index(after: i)
		}
		return result
	}
}

import XCTest
class StringsExtraTests: XCTestCase {
	func testIndices() {
		XCTAssert("".indices(of: "a").isEmpty)

		let text = "abcbcc"
		func assertIndices(of character: Character, count: Int) {
			XCTAssertEqual(text.indices(of: character).map {text[$0]}, Array(repeating: character, count: count))
		}

		XCTAssertEqual(text.indices(of: "a").first, text.startIndex)
		assertIndices(of: "a", count: 1)
		assertIndices(of: "b", count: 2)
		assertIndices(of: "c", count: 3)
	}
}
StringsExtraTests.defaultTestSuite.run()
