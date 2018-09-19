
public struct CountedSet<Element: Hashable> {
	typealias ElementsDictionary = [Element: Int]
	private var elements: ElementsDictionary

	public init() {
		elements = ElementsDictionary()
	}

	public init<S>(_ other: S) where S:Sequence, S.Element == Element {
		self.init()
		insert(contentsOf: other)
	}

	public mutating func insert(_ newelement: Element, count: Int = 1) {
		elements[newelement, default: 0] += count

	}

	public mutating func insert<S>(contentsOf other: S) where S:Sequence, S.Element == Element {
		for newelement in other {
			insert(newelement)
		}
	}

	public func count(for element: Element) -> Int {
		return elements[element, default: 0]
	}

	public var count: Int {
		var result = 0
		for count in elements.values {
			result += count
		}
		return result
	}

	@discardableResult
	public mutating func remove(_ element: Element, count countToRemove: Int = 1) -> Int {
		guard var count = elements[element] else { return 0 }
		count -= countToRemove
		guard count > 0 else {
			elements.removeValue(forKey: element)
			return 0
		}
		elements[element] = count
		return count
	}

	public func contains(_ element: Element) -> Bool {
		return elements[element] != nil
	}
}

extension CountedSet: ExpressibleByArrayLiteral {
	public init(arrayLiteral elementarray: Element...) {
		self.init(elementarray)
	}
}


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

