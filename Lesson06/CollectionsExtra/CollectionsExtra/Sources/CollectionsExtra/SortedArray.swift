

public extension Range where Bound == Int {
	/// The value in the middle of this range. Returns nil if the range is empty.
	var middle: Int? {
		guard !isEmpty else { return nil }
		return lowerBound + count / 2
	}
}

extension Array where Element: Comparable {

	/// The index to use if you were to insert this element into a sorted array.
	///
	/// - Parameters:
	///   - element: The element to potentially insert.
	///   - range: The range to search in.
	/// - Note: If the element already occurs once or more, the index to one of those will be returned.
	func insertionIndex(for element: Element, in range: Range<Index>) -> Index {
		guard let middle = range.middle else { return range.upperBound }
		if self[middle] < element {
			return insertionIndex(for: element, in: index(after: middle)..<range.upperBound)
		} else if self[middle] > element {
			return insertionIndex(for: element, in: range.lowerBound..<middle)
		}
		return middle
	}

	/// Inserts the element in the correct position in a sorted array.
	///
	/// - Parameter element: The element to insert.
	/// - Returns: The index where the element was inserted.
	@discardableResult
	public mutating func sorted_insert(_ element: Element) -> Index {
		let index = insertionIndex(for: element, in: startIndex..<endIndex)
		self.insert(element, at: index)
		return index
	}

	/// Checks if a sorted array contains an element.
	public func sorted_contains(_ element: Element) -> Bool {
		let index = insertionIndex(for: element, in: startIndex..<endIndex)
		return (index != endIndex) && (self[index] == element)
	}

	/// The index of the first occurrence of this element in a sorted array.
	///
	/// - Parameters:
	///   - element: The element to search for.
	///   - range: The range to search within.
	/// - Returns: The index, or nil if not found.
	public func sorted_index(of element: Element, in range: Range<Index>? = nil) -> Index? {
		let range = range ?? startIndex..<endIndex
		guard let middle = range.middle else {
			let index = range.upperBound
			return (self.indices.contains(index) && self[index] == element) ? index : nil
		}
		if self[middle] < element {
			return sorted_index(of: element, in: index(after: middle)..<range.upperBound)
		}
		return sorted_index(of: element, in: range.lowerBound..<middle)
	}

	/// The index of the last occurrence of this element in a sorted array.
	///
	/// - Parameters:
	///   - element: The element to search for.
	///   - range: The range to search within.
	/// - Returns: The index, or nil if not found.
	public func sorted_lastIndex(of element: Element, in range: Range<Index>? = nil) -> Index? {
		let range = range ?? startIndex..<endIndex
		guard let middle = range.middle else {
			let index = self.index(before: range.upperBound)
			return (self.indices.contains(index) && self[index] == element) ? index : nil
		}
		if self[middle] > element {
			return sorted_lastIndex(of: element, in: range.lowerBound..<middle)
		}
		return sorted_lastIndex(of: element, in: index(after: middle)..<range.upperBound)
	}
}

