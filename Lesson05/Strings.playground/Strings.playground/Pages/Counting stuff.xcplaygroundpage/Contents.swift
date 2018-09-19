
import Foundation

extension String {
	func countLinguisticTokens(ofType unit: NSLinguisticTaggerUnit, options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]) -> Int {
		let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
		tagger.string = self
		let range = NSRange(startIndex..<endIndex, in: self)
		var result = 0
		tagger.enumerateTags(in: range, unit: unit, scheme: .tokenType, options: options, using: { _, _, _ in
			result += 1
		})
		return result
	}

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
}


print("International text")

let internationalText = """
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

for line in internationalText.linguisticTokens(ofType: .paragraph) {
	print(line.linguisticTokens(ofType: .word))
}
internationalText.countLinguisticTokens(ofType: .paragraph)
internationalText.countLinguisticTokens(ofType: .sentence)
internationalText.countLinguisticTokens(ofType: .word)


print()
print("English text")

let english = """
Comparing this  diagram with the one for Array in the previous lesson, we see that both MutableCollection and RandomAccessCollection are missing.
This is because, as we have seen, symbols may take up varying amounts of space. And in a MutableCollection we can replace one element for another. But what if we replace one character with one that takes more space? Then we would have to move all succeeding characters to make room, and the MutableCollection protocol does not allow for this. It is the same with RandomAccessCollection: it requires taking approximately the same amount of time to retrieve the 5th element as the 20000th, and we can't do that when the elements are not of the same size.
"""

for line in english.linguisticTokens(ofType: .paragraph) {
	for sentence in line.linguisticTokens(ofType: .sentence) {
		print(sentence.linguisticTokens(ofType: .word))
	}
	print()
}
english.countLinguisticTokens(ofType: .paragraph)
english.countLinguisticTokens(ofType: .sentence)
english.countLinguisticTokens(ofType: .word)
