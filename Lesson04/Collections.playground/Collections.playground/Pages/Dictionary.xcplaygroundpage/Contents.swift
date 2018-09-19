
var numbers = [0: "zero", 1: "one", 10: "ten", 100: "one hundred"]
print(numbers)

numbers[20] = "twenty" // Add or change value

// Look up returns an optional
if let one = numbers[1] {
	// ...
}

// Or you can use a default value if the key is not found
let two = numbers[2, default: "no sensible default"]

// Remove a value by setting it to nil
numbers[2] = nil

// You can iterate over the contents (again: order is not defined)
for (key, value) in numbers {
	// ...
}

// A collection of all keys
numbers.keys

// A collection of all values
numbers.values
