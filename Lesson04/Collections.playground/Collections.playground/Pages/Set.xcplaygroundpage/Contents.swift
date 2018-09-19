
var numbers: Set = [0,1,2,3,10,2.75,-3,-3.125,-14]

// order is not preserved
print(numbers) // [-3.125, 10.0, 2.75, 2.0, -3.0, 3.0, -14.0, 0.0, 1.0]


// insert if nothing equal is already there
numbers.insert(4)

// insert, and replace it if something equal is already there
numbers.update(with: 4)

numbers.remove(4)
numbers.contains(3)
numbers.isEmpty

for n in numbers {
	// ...
}


extension Double {
	var isInteger: Bool {
		return self.truncatingRemainder(dividingBy: 1) == 0
	}
}

let negativenumbers = numbers.filter { $0 < 0 }
let positivenumbers = numbers.subtracting(negativenumbers.union([0]))

let integers = numbers.filter { $0.isInteger }
let negativeintegers = integers.intersection(negativenumbers)
print(negativeintegers) // [-3.0, -14.0]


// all of the following return “true”
numbers.isSuperset(of: negativeintegers)
integers.isSubset(of: numbers)
positivenumbers.isStrictSubset(of: numbers)
numbers.isStrictSuperset(of: negativenumbers)
negativenumbers.isDisjoint(with: positivenumbers)
