
public protocol Sequence {
	/// A type representing the sequence's elements.
	associatedtype Element

	/// A type that provides the sequence's iteration interface and
	/// encapsulates its iteration state.
	associatedtype Iterator : IteratorProtocol where Iterator.Element == Element

	/// Returns an iterator over the elements of this sequence.
	func makeIterator() -> Iterator
}

public protocol IteratorProtocol {
	/// The type of element traversed by the iterator.
	associatedtype Element


	/// - Returns: The next element in the underlying sequence,
	///   if a next element exists; otherwise, `nil`.
	mutating func next() -> Element?
}
