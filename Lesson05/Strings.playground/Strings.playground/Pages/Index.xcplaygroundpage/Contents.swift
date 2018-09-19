
let alphabet = "abcdefghijklmnopqrstuvwxyz"

alphabet.startIndex
alphabet.endIndex

let b_index = alphabet.index(after: alphabet.startIndex)
let a_index = alphabet.index(before: b_index)
let g_index = alphabet.index(a_index, offsetBy: 6)
alphabet[g_index]
let e_index = alphabet.index(g_index, offsetBy: -2)
alphabet[e_index]

let no_index = alphabet.index(e_index, offsetBy: 30, limitedBy: alphabet.endIndex)

let i = alphabet.index(of: "z")
let a_e_distance = alphabet.distance(from: a_index, to: e_index)

// use in unit tests
extension String.Index: CustomDebugStringConvertible {
	// The offset into a string’s UTF-16 encoding for this index.
	public var debugDescription: String { return "\(encodedOffset)" }
}
