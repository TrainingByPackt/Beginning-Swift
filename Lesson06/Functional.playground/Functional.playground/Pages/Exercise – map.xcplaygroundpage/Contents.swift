// Exercise 1
let text = "how many characters are there in each word"

// let wordLengths =

// Answer: [3, 4, 10, 3, 5, 2, 4, 4]



// Exercise 2

extension Collection where SubSequence: Collection {
	/// Returns the first and longest range possible where `predicate` returns true for all characters.
	public func range(where predicate: (Element) throws -> Bool) rethrows -> Range<Index>? {
		guard let start = try index(where: predicate) else { return nil }
		let end = try self[start..<endIndex]
			.index(where: { try !predicate($0) }) ?? endIndex
		return start..<end
	}
}

// use in unit tests
extension String.Index: CustomDebugStringConvertible {
	// The offset into a string’s UTF-16 encoding for this index.
	public var debugDescription: String { return "\(encodedOffset)" }
}

let isDigit = (Character("0")...Character("9")).contains

"lkjl lkj l llk 583 lkjs lj ".range(where: isDigit)
"lsjf lsfj fl jsljf 0123456789".range(where: isDigit)
"09".range(where: isDigit)
"0".range(where: isDigit)
"ljfsl fjslfks fl ".range(where: isDigit)
"".range(where: isDigit)
