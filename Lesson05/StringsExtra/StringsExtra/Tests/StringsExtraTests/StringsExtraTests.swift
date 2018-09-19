import XCTest
import StringsExtra

class StringsExtraTests: XCTestCase {
	/*
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
	*/
	/*
	let string = """
		Line 1
		line 2
		"""

	func testAllRanges() {
		XCTAssertEqual(string.allRanges(of: "Line", options: .caseInsensitive).count, 2)
		XCTAssertEqual(string.allRanges(of: "Line").count, 1)
		XCTAssertEqual(string.allRanges(of: "hsf").count, 0)
		XCTAssertEqual("LineLineLine".allRanges(of: "Line").count, 3)
		XCTAssertEqual("lalalalalala".allRanges(of: "lala").count, 5)
		XCTAssertEqual("llllllll".allRanges(of: "ll").count, 7)
		XCTAssertEqual(string.allRanges(of: "li", options: .caseInsensitive, locale: .current).map{string[$0]}.count, 2)
		XCTAssertEqual(string.allRanges(of: "li", options: [.caseInsensitive, .backwards], locale: .current).count, 2)
	}
	*/
	/*
	let english = """
		Comparing this  diagram with the one for Array in the previous lesson, we see that both MutableCollection and RandomAccessCollection are missing.
		This is because, as we have seen, symbols may take up varying amounts of space. And in a MutableCollection we can replace one element for another. But what if we replace one character with one that takes more space? Then we would have to move all succeeding characters to make room, and the MutableCollection protocol does not allow for this. It is the same with RandomAccessCollection: it requires taking approximately the same amount of time to retrieve the 5th element as the 20000th, and we can't do that when the elements are not of the same size.
		"""

	func testCountLinguisticTokens_English() {
		XCTAssertEqual(english.countLinguisticTokens(ofType: .paragraph), 2)
		XCTAssertEqual(english.countLinguisticTokens(ofType: .sentence), 6)
		XCTAssertEqual(english.countLinguisticTokens(ofType: .word), 119)
	}

	let internationalText = """
		I can eat glass and it doesn't hurt me.
		ᛖᚴ ᚷᛖᛏ ᛖᛏᛁ ᚧ ᚷᛚᛖᚱ ᛘᚾ ᚦᛖᛋᛋ ᚨᚧ ᚡᛖ ᚱᚧᚨ ᛋᚨᚱ
		Ek get etið gler án þess að verða sár.
		Eg kan eta glas utan å skada meg.
		ᛁᚳ᛫ᛗᚨᚷ᛫ᚷᛚᚨᛋ᛫ᛖᚩᛏᚪᚾ᛫ᚩᚾᛞ᛫ᚻᛁᛏ᛫ᚾᛖ᛫ᚻᛖᚪᚱᛗᛁᚪᚧ᛫ᛗᛖ᛬
		Μπορώ να φάω σπασμένα γυαλιά χωρίς να πάθω τίποτα.
		我能吞下玻璃而不伤身体。
		我能吞下玻璃而不傷身體。
		Góa ē-tàng chia̍h po-lê, mā bē tio̍h-siong.
		私はガラスを食べられます。それは私を傷つけません。
		나는 유리를 먹을 수 있어요. 그래도 아프지 않아요
		काचं शक्नोम्यत्तुम् । नोपहिनस्ति माम् ॥

		"""

	func testCountLinguisticTokens_International() {
		XCTAssertEqual(internationalText.countLinguisticTokens(ofType: .paragraph), 12)
	}
	*/
	/*
	func testCamelCased() {
		XCTAssertEqual("this was lowercase.".camelCased(), "ThisWasLowercase")
		XCTAssertEqual("This Was Capitalised.".camelCased(capitalised: false), "thisWasCapitalised")
		XCTAssertEqual("".camelCased(), "")
		XCTAssertEqual(" ".camelCased(), "")
		XCTAssertEqual("a".camelCased(), "A")
		XCTAssertEqual("-lots .. of _ non-characters here!".camelCased(), "LotsOfNon-CharactersHere")
		XCTAssertEqual("some 9digits 2".camelCased(), "Some9Digits2")
		XCTAssertEqual("only $9 per case".camelCased(), "Only$9PerCase")
		XCTAssertEqual("$&/(%$$j/)=/&/_:;".camelCased(), "$$$J=")
	}
	*/
}

// use in unit tests
extension String.Index: CustomDebugStringConvertible {
	// The offset into a string’s UTF-16 encoding for this index.
	public var debugDescription: String { return "\(encodedOffset)" }
}
