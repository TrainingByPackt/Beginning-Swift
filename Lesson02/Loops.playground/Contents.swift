//: Playground - noun: a place where people can play

import Foundation

let provinces = ["Ontario", "Quebec", "Nova Scotia", "New Brunswick", "Manitoba", "British Columbia", "Prince Edward Island", "Saskatchewan", "Alberta", "Newfoundland and Labrador" ]


var i = 0
repeat {
    print(provinces[i])
    i += 1
} while i < provinces.count-1
print("==============")

i = 0
while i < provinces.count-1 {
    print(provinces[i])
    i += 1
}
print("==============")

var firstLetters = ""

for province in provinces {
    firstLetters += province.prefix(1)
}
print("Canadian provinces start with one of the following letters: \(Set(firstLetters).sorted())")

var nProvinces = [Int]()
for (index, province) in provinces.enumerated() {
    if province.prefix(1) == "N" {
        nProvinces.append(index)
    }
}
print("The indices of provinces starting with 'N' are: \(nProvinces)")





