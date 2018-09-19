
import Foundation

extension String {
	public func allRanges(of aString: String,
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

	public func countLinguisticTokens(ofType unit: NSLinguisticTaggerUnit, options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]) -> Int {
		let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
		tagger.string = self
		let range = NSRange(startIndex..<endIndex, in: self)
		var result = 0
		tagger.enumerateTags(in: range, unit: unit, scheme: .tokenType, options: options, using: { _, _, _ in
			result += 1
		})
		return result
	}
}

extension String {
	public func wordRanges() -> [Range<String.Index>] {
		let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
		var words = [Range<String.Index>]()
		self.enumerateLinguisticTags(
			in: startIndex..<endIndex,
			scheme: NSLinguisticTagScheme.tokenType.rawValue,
			options: options) { (_, range, _, _) in
			words.append(range)
		}
		return words
	}

	public func camelCased(capitalised: Bool = true) -> String {
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
