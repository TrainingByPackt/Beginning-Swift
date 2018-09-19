
var sum: (Int, Int) -> Int

func sumFunction(a: Int, b: Int) -> Int {
	return a + b
}

let sumClosure = {(a: Int, b: Int) in return a + b}

sum = sumFunction
sum = sumClosure
sum = (+)

sum(1,2)


func perform(operation: (Int, Int) -> Int, on a: Int, _ b: Int) -> Int {
	return operation(a,b)
}

perform(operation: +, on: 1, 2)
perform(operation: sumFunction, on: 1, 2)
perform(operation: sumClosure, on: 1, 2)
perform(operation: sum, on: 1, 2)
(+)(1, 2)


// initialisers
extension Int {
	init(add a: Int, _ b: Int) {
		self.init(a + b)
	}
}

sum = Int.init
perform(operation: Int.init, on: 2, 3)


// full name
perform(operation: Int.init(add:_:), on: 4, 5)
sumFunction(a:b:)
perform(operation:on:_:)
Int.init(add:_:)

[[1,2],[2,3]]
	.flatMap({$0})

Array.map([2,3])(-) as [Int]
