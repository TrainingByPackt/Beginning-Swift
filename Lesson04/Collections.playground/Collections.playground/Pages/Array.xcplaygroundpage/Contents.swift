
let a = [0,1,2,3,4] // array literal
var b = a + [5,6]   // join two arrays
let c = Array(repeating: 4.1, count: 3) // repeat one value
// create from any sequence (a String is a sequence of Character)
var characters = Array("The ☀ and 🌙")

b.append(10) // append one element
b += a // append an array
b.append(contentsOf: a) // append an array

b.count // the length of the array

b[0] // 0
b[0] = 9
for nr in b {
	// do something with ‘nr’
}


// Index

characters[2] // read element at index 2 ("e")
characters[2] = "a" // change element at index 2
let removed = characters.remove(at: 8) // remove and return element
characters.insert("i", at: 7) // insert element
characters.insert(contentsOf: "t the", at: 9) // insert collection of elements
print(characters)

characters.indices.contains(4)
characters.indices.contains(20)
characters.indices.contains(characters.endIndex)
