let string = """
Line 1
line 2
"""

let range1 = ..<string.index(of: "1")!
string[range1]

string.hasPrefix("Line")
string.hasSuffix("2")

// These mutate the string:
var mutablestring = string

mutablestring.replaceSubrange(range1, with: "line up")
mutablestring.removeSubrange(range1)
mutablestring.removeFirst()
mutablestring.removeFirst(2)
mutablestring.removeLast()
mutablestring.removeLast(2)

// But there aren't many specifically made for strings:
string.uppercased()
string.lowercased()

// We get a lot more if we import Foundation. All these methods return a new string with the changes, the original string is left intact:
import Foundation

string.contains(" 1")
string.capitalized
string.capitalized(with: Locale.current)
string.replacingOccurrences(of: "Line", with: "line")
string.replacingOccurrences(of: "Line", with: "") // remove all occurrences of
string.replacingOccurrences(of: "line", with: "triangle", options: .caseInsensitive, range: string.startIndex..<string.index(of: "\n")!)

string.rangeOfCharacter(from: .decimalDigits)
let range = string.range(of: "Line")!
string[range]
string.lineRange(for: range)

" \t  trim  \n ".trimmingCharacters(in: .whitespacesAndNewlines)
"Padded".padding(toLength: 10, withPad: " ", startingAt: 0)
"Pad".padding(toLength: 10, withPad: "_ ", startingAt: 1)
"Paddedpad thiswillberemoved".padding(toLength: 10, withPad: "_ ", startingAt: 0)


// These return arrays of strings:
string.components(separatedBy: ". ")
string.components(separatedBy: .newlines)


// use in unit tests
extension String.Index: CustomDebugStringConvertible {
	// The offset into a string’s UTF-16 encoding for this index.
	public var debugDescription: String { return "\(encodedOffset)" }
}
