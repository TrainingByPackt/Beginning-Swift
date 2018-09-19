
let numbers = [0,2,4,2,-4,-5,0]

let inverted = numbers
	.filter { $0 != 0 } // to avoid division by 0
	.map { 1.0/Double($0) }

extension BidirectionalCollection where Element: Equatable {
	/// The range from after the first occurrence of `fromElement`, up to the next occurrence of `toElement`.
	public func range(between fromElement: Element, and toElement: Element) -> Range<Index>? {
		guard let fromIndex = index(of: fromElement) else { return nil }
		let start = index(after: fromIndex)
		guard let toIndex = suffix(from: start)
			.index(of: toElement) else { return nil }
		return start..<toIndex
	}
}

// use in unit tests
extension String.Index: CustomDebugStringConvertible {
	// The offset into a string’s UTF-16 encoding for this index.
	public var debugDescription: String { return "\(encodedOffset)" }
}

let text = "This is \"in quotes\".. Some of this is (inside parenthesis)"
text[text.range(between: "(", and: ")")!]
text[text.range(between: "\"", and: "\"")!]
text.range(between: ")", and: ")")
text[text.range(between: ".", and: ".")!]


