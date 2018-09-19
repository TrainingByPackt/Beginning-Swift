
import XCTest
import CollectionsExtra

class SortedArrayTests: XCTestCase {

	// the following unit tests are originally from
	// https://github.com/ole/SortedArray/blob/5d7988ff5d90fff1880b279269f83b779ef84e27/Tests/SortedArrayTests/SortedArrayTests.swift
	func testInsertAtBeginningPreservesSortOrder() {
		var sut = Array(1...3)
		sut.sorted_insert(0)
		XCTAssertEqual(sut, [0,1,2,3])
	}

	func testInsertInMiddlePreservesSortOrder() {
		var sut = Array(1...5)
		sut.sorted_insert(4)
		XCTAssertEqual(sut, [1,2,3,4,4,5])
	}

	func testInsertAtEndPreservesSortOrder() {
		var sut = Array(1...3)
		sut.sorted_insert(5)
		XCTAssertEqual(sut, [1,2,3,5])
	}

	func testInsertAtBeginningReturnsInsertionIndex() {
		var sut = Array([1,2,3])
		let index = sut.sorted_insert(0)
		XCTAssertEqual(index, 0)
	}

	func testInsertInMiddleReturnsInsertionIndex() {
		var sut = Array([1,2,3,5])
		let index = sut.sorted_insert(4)
		XCTAssertEqual(index, 3)
	}

	func testInsertAtEndReturnsInsertionIndex() {
		var sut = Array([1,2,3])
		let index = sut.sorted_insert(100)
		XCTAssertEqual(index, 3)
	}

	func testInsertInEmptyArrayReturnsInsertionIndex() {
		var sut = Array<Int>()
		let index = sut.sorted_insert(10)
		XCTAssertEqual(index, 0)
	}

	func testInsertEqualElementReturnsCorrectInsertionIndex() {
		var sut = Array([0,1,1,2,3])
		let index = sut.sorted_insert(1)
		XCTAssert(index == 1 || index == 2 || index == 3)
	}

	func testInsertContentsOfPreservesSortOrder() {
		var sut = Array([8,9,10])
		(7...11).reversed().forEach { sut.sorted_insert($0) }
		XCTAssertEqual(sut, [7,8,8,9,9,10,10,11])
	}

	func testIndexOfFindsElementInMiddle() {
		let sut = Array(["a","k","r","z"])
		let index = sut.sorted_index(of: "k")
		XCTAssertEqual(index, 1)
	}

	func testIndexOfFindsFirstElement() {
		let sut = Array(1..<10)
		let index = sut.sorted_index(of: 1)
		XCTAssertEqual(index, 0)
	}

	func testIndexOfFindsLastElement() {
		let sut = Array(1..<10)
		let index = sut.sorted_index(of: 9)
		XCTAssertEqual(index, 8)
	}

	func testIndexOfReturnsNilWhenNotFound() {
		let sut = Array(1..<9)
		let index = sut.sorted_index(of: 10)
		XCTAssertNil(index)
	}

	func testIndexOfReturnsNilForEmptyArray() {
		let sut = Array<Int>()
		let index = sut.sorted_index(of: 1)
		XCTAssertNil(index)
	}

	func testIndexOfCanDealWithSingleElementArray() {
		let sut = Array<Int>([5])
		let index = sut.sorted_index(of: 5)
		XCTAssertEqual(index, 0)
	}

	func testIndexOfFindsFirstIndexOfDuplicateElements1() {
		let sut = Array([1,2,3,3,3,3,3,3,3,3,4,5])
		let index = sut.sorted_index(of: 3)
		XCTAssertEqual(index, 2)
	}

	func testIndexOfFindsFirstIndexOfDuplicateElements2() {
		let sut = Array([1,2,3,4,4,4,4,4,4,4,4])
		let index = sut.sorted_index(of: 4)
		XCTAssertEqual(index, 3)
	}

	func testIndexOfFindsFirstIndexOfDuplicateElements3() {
		let sut = Array(String(repeating: "A", count: 10))
		let index = sut.sorted_index(of: "A")
		XCTAssertEqual(index, 0)
	}

	func testIndexOfFindsFirstIndexOfDuplicateElements4() {
		let sut = Array(repeating: "a", count: 100_000)
		let index = sut.sorted_index(of: "a")
		XCTAssertEqual(index, 0)
	}

	func testIndexOfFindsFirstIndexOfDuplicateElements5() {
		let sourceArray = Array(repeating: 5, count: 100_000) + [1,2,6,7,8,9]
		let sut = sourceArray.sorted()
		let index = sut.sorted_index(of: 5)
		XCTAssertEqual(index, 2)
	}


	func testLastIndexOfFindsElementInMiddle() {
		let sut = Array(["a","k","r","z"]).sorted()
		let index = sut.sorted_lastIndex(of: "k")
		XCTAssertEqual(index, 1)
	}

	func testLastIndexOfFindsFirstElement() {
		let sut = Array(1..<10)
		let index = sut.sorted_lastIndex(of: 1)
		XCTAssertEqual(index, 0)
	}

	func testLastIndexOfFindsLastElement() {
		let sut = Array(1..<10)
		let index = sut.sorted_lastIndex(of: 9)
		XCTAssertEqual(index, 8)
	}

	func testLastIndexOfReturnsNilWhenNotFound() {
		let sut = Array("Hello World").sorted()
		let index = sut.sorted_lastIndex(of: "h")
		XCTAssertNil(index)
	}

	func testLastIndexOfReturnsNilForEmptyArray() {
		let sut = Array<Int>()
		let index = sut.sorted_lastIndex(of: 1)
		XCTAssertNil(index)
	}

	func testLastIndexOfCanDealWithSingleElementArray() {
		let sut = Array<Int>([5])
		let index = sut.sorted_lastIndex(of: 5)
		XCTAssertEqual(index, 0)
	}

	func testLastIndexOfFindsLastIndexOfDuplicateElements1() {
		let sut = Array([1,2,3,3,3,3,3,3,3,3,4,5])
		let index = sut.sorted_lastIndex(of: 3)
		XCTAssertEqual(index, 9)
	}

	func testLastIndexOfFindsLastIndexOfDuplicateElements2() {
		let sut = Array([1,2,3,4,4,4,4,4,4,4,4])
		let index = sut.sorted_lastIndex(of: 4)
		XCTAssertEqual(index, 10)
	}

	func testLastIndexOfFindsLastIndexOfDuplicateElements3() {
		let sut = Array(String(repeating: "A", count: 10))
		let index = sut.sorted_lastIndex(of: "A")
		XCTAssertEqual(index, 9)
	}

	func testsContains() {
		let sut = Array("Lorem ipsum").sorted()
		XCTAssertTrue(sut.sorted_contains(" "))
		XCTAssertFalse(sut.sorted_contains("a"))

		XCTAssertFalse(Array<Int>().sorted_contains(3))
		XCTAssertFalse([1,2,3].sorted_contains(4))
		XCTAssertFalse([1,2,3].sorted_contains(0))
		XCTAssert([1,2,3].sorted_contains(1))
		XCTAssert([1,2,3].sorted_contains(2))
		XCTAssert([1,2,3].sorted_contains(3))
	}

}
