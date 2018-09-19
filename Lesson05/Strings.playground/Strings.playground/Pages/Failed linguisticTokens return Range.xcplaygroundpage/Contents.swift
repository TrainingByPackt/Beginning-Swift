
let text = """
I can eat glass and it doesn't hurt me.
ᛖᚴ ᚷᛖᛏ ᛖᛏᛁ ᚧ ᚷᛚᛖᚱ ᛘᚾ ᚦᛖᛋᛋ ᚨᚧ ᚡᛖ ᚱᚧᚨ ᛋᚨᚱ
Ek get etið gler án þess að verða sár.
Eg kan eta glas utan å skada meg.
ᛁᚳ᛫ᛗᚨᚷ᛫ᚷᛚᚨᛋ᛫ᛖᚩᛏᚪᚾ᛫ᚩᚾᛞ᛫ᚻᛁᛏ᛫ᚾᛖ᛫ᚻᛖᚪᚱᛗᛁᚪᚧ᛫ᛗᛖ᛬
Μπορώ να φάω σπασμένα γυαλιά χωρίς να πάθω τίποτα.
我能吞下玻璃而不伤身体。
我能吞下玻璃而不傷身體。
Góa ē-tàng chia̍h po-lê, mā bē tio̍h-siong.
私はガラスを食べられます。それは私を傷つけません。
나는 유리를 먹을 수 있어요. 그래도 아프지 않아요
काचं शक्नोम्यत्तुम् । नोपहिनस्ति माम् ॥

"""


import Foundation

extension String {
	func linguisticTokens(ofType unit: NSLinguisticTaggerUnit, options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]) -> [String] {
		let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
		tagger.string = self
		let range = NSRange(startIndex..<endIndex, in: self)
		var result = [String]()
		tagger.enumerateTags(in: range, unit: unit, scheme: .tokenType, options: options, using: { _, tokenRange, _ in
			let token = (self as NSString).substring(with: tokenRange)
			result.append(token)
		})
		return result
	}

	func linguisticTokens2(ofType: NSLinguisticTaggerUnit, options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]) -> [Range<String.Index>] {
		let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
		tagger.string = self
		let range = NSRange(startIndex..<endIndex, in: self)
		var result = [Range<String.Index>]()
		tagger.enumerateTags(in: range, unit: ofType, scheme: .tokenType, options: options, using: { _, tokenRange, _ in
			let actualrange = Range(tokenRange, in: self) ?? String.Index.init(encodedOffset: tokenRange.lowerBound)..<self.rangeOfComposedCharacterSequence(at: String.Index.init(encodedOffset: tokenRange.upperBound)).upperBound
			result.append(actualrange)
		})
		return result
	}

	func linguisticTokens3(ofType: NSLinguisticTaggerUnit, options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]) -> [Range<String.Index>] {
		let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
		tagger.string = self
		let range = NSRange(startIndex..<endIndex, in: self)
		var result = [Range<String.Index>]()
		
		tagger.enumerateTags(in: range, unit: ofType, scheme: .tokenType, options: options, using: { _, tokenRange, _ in
			let word = (self as NSString).substring(with: tokenRange)
			let actualrange = Range(tokenRange, in: self) ?? String.Index.init(encodedOffset: tokenRange.lowerBound)..<self.index( (String.Index.init(encodedOffset: tokenRange.lowerBound)), offsetBy: word.count )
			result.append(actualrange)
		})
		return result
	}

	func wordRanges() -> [Range<String.Index>] {
		let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
		var words = [Range<String.Index>]()
		self.enumerateLinguisticTags(in: startIndex..<endIndex, scheme: NSLinguisticTagScheme.tokenType.rawValue, options: options) { (type, range, _, _) in
			assert(type == "Word")
			words.append(range)
		}
		return words
	}
}

let a1: [String] = text.linguisticTokens(ofType: .word)
let a2: [String] = text.linguisticTokens2(ofType: .word).map{String(text[$0])}
let a3: [String] = text.linguisticTokens3(ofType: .word).map{String(text[$0])}
let wordRanges: [String] = text.wordRanges().map{String(text[$0])}

a1.count
a2.count
a3.count
wordRanges.count
a1 == a2
a1 == a3
a2 == a3
a1 == wordRanges

print("linguisticTokens vs linguisticTokens2")
for (nr,(a1,a2)) in zip(a1, a2).enumerated() {
	if a1 != a2 {
		print(nr, ":", a1, "!=", a2)
	}
}
print()
print("linguisticTokens vs linguisticTokens3")
for (nr,(a1,a3)) in zip(a1, a3).enumerated() {
	if a1 != a3 {
		print(nr, ":", a1, "!=", a3)
	}
}

/*
// use in unit tests
extension String.Index: CustomDebugStringConvertible {
	// The offset into a string’s UTF-16 encoding for this index.
	public var debugDescription: String { return "\(encodedOffset)" }
}
*/

extension String {
	func words() -> [String] {
		var words = [String]()
		self.enumerateSubstrings(in: self.startIndex ..< self.endIndex, options: [.byWords]) { (substring, _, _, _) -> () in
			if let substring = substring {
				words.append(substring)
			}
		}
		return words
	}
}


