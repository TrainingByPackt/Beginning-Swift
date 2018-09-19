import XCTest
import CollectionsExtra

class CountedSetTests: XCTestCase {
	/*
	func testInsert() {
		var countedSet = CountedSet<Int>()

		for i in 0...10 {
			countedSet.insert(i)
		}
		countedSet.insert(contentsOf: 5...15)
		XCTAssertEqual(countedSet.count(for: 5), 2)
		XCTAssertEqual(countedSet.count(for: 11), 1)
		XCTAssertEqual(countedSet.count, 22)
	}


	func testInit() {
		let set = CountedSet(["a","b","c","a"])

		XCTAssertEqual(set.count(for: "a"), 2)
		XCTAssertEqual(set.count(for: "b"), 1)
		XCTAssertEqual(set.count(for: "c"), 1)
		XCTAssertEqual(set.count, 4)
	}

	func testInsertSetIntoSet() {
		var set = CountedSet(["a","y","b","c","a"])
		let set2 = CountedSet(["a","b","b","c","b","z"])

		set.insert(contentsOf: set2)

		XCTAssertEqual(set.count(for: "a"), 3)
		XCTAssertEqual(set.count(for: "b"), 4)
		XCTAssertEqual(set.count(for: "c"), 2)
		XCTAssertEqual(set.count(for: "y"), 1)
		XCTAssertEqual(set.count(for: "z"), 1)
		XCTAssertEqual(set.count, 11)
	}

	// the following unit tests are originally from
	// https://github.com/0x7fffffff/CountedSet/blob/8b91ee8d062935913486a7656f982d0ec17319ab/Tests/CountedSetTests/SetsTests.swift

	func testRemove() {
		var countedSet = CountedSet<Int>()
		countedSet.insert(42)
		countedSet.insert(17)

		countedSet.remove(42)
		countedSet.remove(42)
		countedSet.remove(42)

		XCTAssertEqual(countedSet.count, 1)
	}

	func testRemoveWithCount() {
		var countedSet: CountedSet<Int> = [1,42,42,42,42,42,3,4]

		XCTAssertEqual(countedSet.count(for: 42), 5)

		countedSet.remove(42)
		XCTAssertEqual(countedSet.count(for: 42), 4)

		countedSet.remove(42, count: 2)
		XCTAssertEqual(countedSet.count(for: 42), 2)

		XCTAssertTrue(countedSet.contains(42))
		countedSet.remove(42, count: 2)
		XCTAssertFalse(countedSet.contains(42))

		countedSet.remove(1, count: 55)
		XCTAssertFalse(countedSet.contains(1))
	}

	func testCountForElement() {
		var countedSet: CountedSet<Int> = [1, 2, 3, 4, 5]

		XCTAssertEqual(countedSet.count(for: 3), 1)

		countedSet.insert(3, count: 2)
		XCTAssertEqual(countedSet.count(for: 3), 3)

		countedSet.remove(3)
		countedSet.remove(3)
		XCTAssertEqual(countedSet.count(for: 3), 1)
		countedSet.remove(3)
		XCTAssertEqual(countedSet.count(for: 3), 0)
		countedSet.remove(3)
		XCTAssertEqual(countedSet.count(for: 3), 0)
	}

	func testIsEmpty() {
		var countedSet = CountedSet<Int>()

		XCTAssert(countedSet.isEmpty)

		countedSet.insert(3)

		XCTAssertFalse(countedSet.isEmpty)

		countedSet.remove(3)

		XCTAssert(countedSet.isEmpty)
	}

	func testCount() {
		var countedSet = CountedSet<Int>()

		countedSet.insert(0)
		countedSet.insert(1)
		countedSet.insert(1)

		XCTAssertEqual(countedSet.count, 3)

		countedSet.remove(1)
		countedSet.remove(1)
		countedSet.remove(1)
		countedSet.remove(2)

		XCTAssertEqual(countedSet.count, 1)
	}
	*/
}

