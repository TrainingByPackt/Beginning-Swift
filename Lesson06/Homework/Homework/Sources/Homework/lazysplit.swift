import Foundation

extension LazySequenceProtocol where Elements: StringProtocol, Elements.Index == String.Index {
	public func allRanges(of aString: String,
								 options: String.CompareOptions = [],
								 range searchRange: Range<String.Index>? = nil,
								 locale: Locale? = nil)
		-> LazySequence<UnfoldSequence<Range<String.Index>, Range<String.Index>>> {

			let searchRange = searchRange ?? elements.startIndex..<elements.endIndex
			return sequence(state: searchRange) {
				(searchRange) -> Range<String.Index>? in

				guard let foundRange = self.elements.range(
					of: aString, options: options,
					range: searchRange, locale: locale)
					else { return nil }
				searchRange = options.contains(.backwards) ?
					searchRange.lowerBound..<self.elements.index(before: foundRange.upperBound) :
					self.elements.index(after: foundRange.lowerBound)..<searchRange.upperBound
				return foundRange
				}.lazy
	}
}

extension LazySequenceProtocol {
	/// Group the elements of this sequence in tuples of 2.
	/// If there is an odd number of elements, the last element is discarded.
	public func group2() -> LazySequence<UnfoldSequence<(Element, Element), Iterator>> {
		return sequence(state: self.makeIterator()) { iterator in
			let result = iterator.next().flatMap { a in
				iterator.next().map { b in (a,b) }
			}
			return result
		}.lazy
	}
}


private func joinSequences<S1,S2>(_ s1: S1, _ s2: S2)
	-> UnfoldSequence<S1.Element, (Optional<S1.Iterator>, S2.Iterator)>
	where S1:Sequence, S2:Sequence, S1.Element == S2.Element {
		return sequence(state: (Optional(s1.makeIterator()), s2.makeIterator()))
		{ seqs -> S1.Element? in
			guard let _ = seqs.0 else { return seqs.1.next() }
			return seqs.0?.next()
				?? { seqs.0 = nil; return seqs.1.next() }()
		}
}

public func +<S1,S2>(s1: S1, s2: S2)
	-> UnfoldSequence<S1.Element, (Optional<S1.Iterator>, S2.Iterator)>
	where S1:Sequence, S2:Sequence, S1.Element == S2.Element {
		return joinSequences(s1, s2)
}

public func +<S1,S2>(s1: S1, s2: S2)
	-> LazySequence<UnfoldSequence<S1.Element, (Optional<S1.Iterator>, S2.Iterator)>>
	where S1:Sequence, S2:LazySequenceProtocol, S1.Element == S2.Element {
		return joinSequences(s1, s2).lazy
}

public func +<S1,S2>(s1: S1, s2: S2)
	-> LazySequence<UnfoldSequence<S1.Element, (Optional<S1.Iterator>, S2.Iterator)>>
	where S1:LazySequenceProtocol, S2:Sequence, S1.Element == S2.Element {
		return joinSequences(s1, s2).lazy
}

extension LazySequenceProtocol where Elements: StringProtocol, Elements.Index == String.Index {
	public func split(separator: String, options: String.CompareOptions = [], locale: Locale? = nil)
		-> LazySequence<AnySequence<Range<String.Index>>> {
			precondition(!options.contains(.backwards), "Splitting strings backwards has not been implemented.")

			let separators = self.allRanges(of: separator, options: options, range: nil, locale: locale)
				.flatMap { [$0.lowerBound, $0.upperBound] }
			let result = ([elements.startIndex] + separators + [elements.endIndex])
				.flatMap{$0}
				.group2()
				.map(Range.init(uncheckedBounds: ))
			return AnySequence(result).lazy
	}
}

