
let string = "This is  a pretty 👍🏽 sentence"
string[...]

string.dropFirst()
string.dropFirst(5)
string.dropLast()
string.dropLast(9)
string.drop(while:
	{$0 != " "})

let space_index = string.index(of: " ") ?? string.startIndex
string.prefix(7)
string.prefix(upTo: space_index)
string.prefix(through: space_index)
string.prefix(while:
	{!["a", "e", "i", "o", "u"].contains($0)})
string.suffix(8)
string.suffix(from: space_index)

string.split(separator: " ")
string.split(separator: " ", maxSplits: 4, omittingEmptySubsequences: false)
string.split(whereSeparator:
	{["a", "e", "i", "o", "u"].contains($0)})
