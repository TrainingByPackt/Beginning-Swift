
let string = """
Line 1
line 2
"""

import Foundation

extension String {
	func allRanges(of aString: String,
						options: String.CompareOptions = [],
						range searchRange: Range<String.Index>? = nil,
						locale: Locale? = nil) -> [Range<String.Index>] {

		var searchRange = searchRange ?? startIndex..<endIndex
		var ranges = [Range<String.Index>]()

		while let foundRange = self.range(of: aString, options: options, range: searchRange, locale: locale) {
			ranges.append(foundRange)
			searchRange = options.contains(.backwards) ?
				searchRange.lowerBound..<self.index(before: foundRange.upperBound) :
				self.index(after: foundRange.lowerBound)..<searchRange.upperBound
		}
		return ranges
	}
}

string.allRanges(of: "Line", options: .caseInsensitive).count
"LineLineLine".allRanges(of: "Line").count
"lalalalalala".allRanges(of: "lala").count
"llllllll".allRanges(of: "ll").count
string.allRanges(of: "li", options: .caseInsensitive, locale: Locale.current)
	.map{string[$0]}
string.allRanges(of: "li", options: [.caseInsensitive, .backwards], locale: .current).count


// use in unit tests
extension String.Index: CustomDebugStringConvertible {
	// The offset into a string’s UTF-16 encoding for this index.
	public var debugDescription: String { return "\(encodedOffset)" }
}

