//: Playground - noun: a place where people can play

import Foundation



class MyString {
    var content = "Foo"
}

let string1 = MyString()
let string2 = MyString()
let string3 = string2


var isContentEqual = string1.content == string2.content
var isObjectEqual = string1 === string2
isObjectEqual = string2 === string3

string2.content = "Bar"
isContentEqual = string1.content == string2.content
isObjectEqual = string1 === string2


let val = 1

for i in 1..<16 {
    print("\(val) shifted left \(i) times is \(val << i)")
}

