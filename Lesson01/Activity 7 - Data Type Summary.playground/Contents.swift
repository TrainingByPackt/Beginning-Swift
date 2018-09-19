//: Using Optionals

import Foundation

let dVal = 4.9876

var iValRounded = true
var iVal = Int(dVal.rounded())
var formatDigits = 2


let nf = NumberFormatter()
nf.numberStyle = .decimal
nf.maximumFractionDigits = formatDigits
var formattedDouble = nf.string(from: NSNumber(value: dVal)) ?? "#Err"

print("The original number was \(formattedDouble) (rounded to \(formatDigits) decimal places), while the value \(iValRounded ? "rounded" : "unrounded") to Integer is \(iVal).")

formatDigits = 0
nf.maximumFractionDigits = formatDigits
formattedDouble = nf.string(from: NSNumber(value: dVal)) ?? "#Err"
iValRounded = false
iVal = Int(dVal)

print("The original number was \(formattedDouble) (rounded to \(formatDigits) decimal places), while the value \(iValRounded ? "rounded" : "unrounded") to Integer is \(iVal).")



