
/*
// Turn this into a collection of Element,
// where each <key> in the elements dictionary is repeated <value> number of times.
extension CountedSet: Collection {

	// A custom index type, which contains an index into the elements dictionary
	// and the remaining number of times the element should be repeated.
	public struct Index: Comparable {
		let elementsindex: ElementsDictionary.Index
		let remaining: Int

		public static func <(lhs: Index, rhs: Index) -> Bool {
			return (lhs.elementsindex == rhs.elementsindex) ? lhs.remaining > rhs.remaining
				: lhs.elementsindex < rhs.elementsindex
		}

		public static func ==(lhs: Index, rhs: Index) -> Bool {
			return (lhs.elementsindex == rhs.elementsindex) && (lhs.remaining == rhs.remaining)
		}
	}

	public var startIndex: Index {
		return Index(elementsindex: elements.startIndex, remaining: elements.first?.value ?? 0)
	}

	public var endIndex: Index {
		return Index(elementsindex: elements.endIndex, remaining: 0)
	}

	public func index(after previous: Index) -> Index {
		if previous.remaining > 1 {
			return Index(elementsindex: previous.elementsindex, remaining: previous.remaining - 1)
		}
		let next = elements.index(after: previous.elementsindex)
		guard next != elements.endIndex else { return endIndex }
		return Index(elementsindex: next, remaining: elements[next].value)
	}

	public subscript(index: Index) -> Element {
		return elements[index.elementsindex].key
	}
}
*/
