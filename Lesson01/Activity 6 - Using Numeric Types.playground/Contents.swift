//: Using Optionals

import UIKit

var base2 = 0b101010
var base10 = 42
var hex = 0x2A
var scientific = 4.2E+7  // Swift uses Double for scientific notation, even though this isn't (really) a floating point number
let double = 4.99993288828
var castToInt = Int(double)
var roundToInt = Int(double.rounded())
var bigUnsignedNumber:UInt64 = 18_000_000_000_000_000_000 // without explicit Type, this will overflow Int inference

print("Printing \(type(of: base2)): \(base2)")
print("Printing \(type(of: base10)): \(base10)")
print("Printing \(type(of: hex)): \(hex)")
print("Printing \(type(of: scientific)): \(scientific)")
print("Printing \(type(of: double)): \(double)")
print("Printing \(type(of: castToInt)): \(castToInt)")
print("Printing \(type(of: roundToInt)): \(roundToInt)")
print("Printing \(type(of: bigUnsignedNumber)): \(bigUnsignedNumber)")

