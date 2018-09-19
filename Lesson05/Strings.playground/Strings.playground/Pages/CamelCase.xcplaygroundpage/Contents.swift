import Foundation

extension String {
	func wordRanges() -> [Range<String.Index>] {
		let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
		var words = [Range<String.Index>]()
		self.enumerateLinguisticTags(in: startIndex..<endIndex,
											  scheme: NSLinguisticTagScheme.tokenType.rawValue,
											  options: options) { (type, range, _, _) in
			words.append(range)
		}
		return words
	}

	func camelCased(capitalised: Bool = true) -> String {
		var wordRanges = self.wordRanges()
		guard !wordRanges.isEmpty else { return "" }
		let firstRange = wordRanges.removeFirst()
		var result = capitalised ? self[firstRange].capitalized : self[firstRange].lowercased()
		for range in wordRanges {
			result += self[range].capitalized
		}
		return result
	}
}

"this was lowercase.".camelCased()
"This Was Capitalised.".camelCased(capitalised: false)
"".camelCased()
" ".camelCased()
"a".camelCased()
"-lots .. of _ non-characters here!".camelCased()
"some 9digits 2".camelCased()
"only $9 per case".camelCased()
"$&/(%$$j/)=/&/_:;".camelCased()


// use in unit tests
extension String.Index: CustomDebugStringConvertible {
	// The offset into a string’s UTF-16 encoding for this index.
	public var debugDescription: String { return "\(encodedOffset)" }
}


