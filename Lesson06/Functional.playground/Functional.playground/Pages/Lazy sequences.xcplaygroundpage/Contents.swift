
let array = [1,2,3,4]
let lazyArray = array.lazy

let complexType = lazyArray
	.flatMap { -2..<$0 }
	.map { $0*$0 }
//	.filter { $0<4 } // Uncomment this line and the compiler will take a very long time
//	.drop(while: {$0 < 2})


// comment out the line below, and you'll notice the operations above are never run.
let eager = complexType.dropFirst(4)

let shorterTypeSignature = AnySequence(complexType).lazy
// LazySequence<AnySequence<Int>>



/*
lazyArray.filter
lazyArray.map
lazyArray.flatMap
lazyArray.drop(while: )
lazyArray.prefix(while: )
*/

