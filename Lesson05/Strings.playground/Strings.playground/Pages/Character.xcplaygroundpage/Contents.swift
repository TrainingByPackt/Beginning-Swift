
let string = "The ☀️ and 🌙"
string.utf8.count // 19
string.utf16.count // 13
string.unicodeScalars.count // 12
string.count // 11


let moon = Character("🌙")
String(moon).utf8.count // 4
String(moon).utf16.count // 2
moon.unicodeScalars.count // 1

let sun: Character = "☀️"
String(sun).utf8.count // 6
String(sun).utf16.count // 2
sun.unicodeScalars.count // 2

let accented_e: Character = "é"
String(accented_e).utf8.count // 2
String(accented_e).utf16.count // 1
accented_e.unicodeScalars.count // 1

let another_accented_e: Character = "e\u{0301}" // "e" + combining acute accent
String(another_accented_e).utf8.count // 3
String(another_accented_e).utf16.count // 2
another_accented_e.unicodeScalars.count // 2

accented_e == another_accented_e // true

let symbols = ["é", "김", "🇮🇳"]
for c in symbols {
	print(c, "\t", c.utf8.count, c.utf16.count, c.unicodeScalars.count)
}

let flag = "🇮🇳"
print(flag.unicodeScalars.first!, flag.unicodeScalars.last!)

