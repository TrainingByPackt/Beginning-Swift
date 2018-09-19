
let literal = "string from literal"

let multilineLiteral = """
	line 1
	line 2
		line 3 indented

	"""

// special characters: \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quotation mark) and \' (single quotation mark)

// hexadecimal Unicode code point
let blackDiamond = "\u{2666}"
let brokenHeart = "\u{1F494}"

// string interpolation
let array = [1,2,3]
let stringInterpolation = "The array \(array) has \(array.count) items."
// "The array [1, 2, 3] has 3 items."

// Strings can describe absolutely any type
struct CustomType {
	let value: Int
	let otherValue: Bool
}
let customType = CustomType(value: 5, otherValue: false)

String(describing: customType) // "CustomType(value: 5, otherValue: false)"

// Customise the description
extension CustomType: CustomStringConvertible {
	var description: String {
		return "\(value) and \(otherValue)"
	}
}

String(describing: customType) // "5 and false"

// Repeat text
String(repeating: "la", count: 5)

// Read file
import Foundation

do {
	let fileContents = try String(contentsOfFile: "file.txt")
} catch { /* ... */ }

