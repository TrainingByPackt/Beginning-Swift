
let powersOf2 = sequence(first: 1) {
	let result = $0.multipliedReportingOverflow(by: 2)
	return result.overflow ? nil : result.partialValue
}

print("powersOf2:")
print(Array(powersOf2))

let fibonacci = sequence(state: (0,1)) { numbers -> Int? in
	numbers = (numbers.1, numbers.0 + numbers.1)
	return numbers.0
	}.prefix(91)

print()
print("fibonacci:")
print(Array(fibonacci))

extension LazySequenceProtocol {
	///  Group the elements of this sequence in tuples of 2.
	///  If there is an odd number of elements, the last element is discarded.
	func group2() -> LazySequence<UnfoldSequence<(Element, Element), Iterator>> {
		return sequence(state: self.makeIterator()) { iterator in
			let result = iterator.next().flatMap { a in
				iterator.next().map { b in (a,b) }
			}
			return result
		}.lazy
	}
}

/*
// The code from 'let result' to 'return result' does the same as this:
guard let a = iterator.next(),
	let b = iterator.next()
	else { return nil }
return (a,b)
*/

print()
print("group2:")
print(Array(powersOf2.lazy.group2()))
