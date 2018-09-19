
let numbers = [-4,4,2,-8,0]

// filter
let negative =
	numbers.filter {$0<0}

// sequence map
let squared =
	numbers.map {$0*$0}

squared.forEach { print($0) }

// optional map
let textTimesTwo = Int("4")
	.map { $0 * 2 }

var delegate: Void? = ()
func doSomething(with d: Void) {}

if let delegate = delegate {
	doSomething(with: delegate)
}

delegate.map(doSomething)

// flatMap
let ranges = [0...2, 5...7, 10...11]
let bounds =
	ranges.flatMap {[$0.lowerBound, $0.upperBound]}

["a","1","b","3"].flatMap(Int.init)

var stringOptional: String?
let intOptional = stringOptional.flatMap(Int.init)

// reduce
let multiplied = negative.reduce(1) {
	result, element in result * element }
let multiplied2 = negative.reduce(into: 1) {
	result, element in result = result * element }

