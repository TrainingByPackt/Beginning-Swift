var characters = Array("The ☀ and 🌙")
var slice = characters[4..<9]
print(slice) // ["☀", " ", "a", "n", "d"]

slice.startIndex
slice.endIndex
slice.indices
slice.count

slice
characters
slice[5] = "?"
slice
characters


// Create
characters.prefix(3) // the first three elements
characters.prefix(while: {$0 != " "}) // all elements before the first space
characters.suffix(2) // the last two elements
characters.suffix(from: 4) // elements from number 4 and out

characters[2...4] // elements 2 to 4 inclusive
characters[3..<6] // elements 3 up to, but not including 6
characters[3...] // from element 3 to the end
characters[...5] // from the beginning up to and including 5
characters[..<5] // from the beginning up to, but not including 5
