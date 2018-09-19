//: Playground - noun: a place where people can play

import UIKit

// Store an error condition as an integer
let success = 0
let ioFailure = 1
let timeoutFailure = 2

// Store an error condition as an enum type
enum Result {
    case success
    case ioFailure
    case timeoutFailure
}

// Store an error condition as an enum type with raw value
enum ResultWithRawValue: Int {
    case success = 0
    case ioFailure = 1
    case timeoutFailure = 2
}

let error1 = ioFailure
let error2 = Result.ioFailure
let error3 = ResultWithRawValue.ioFailure

// Now print out the error result from each case.
print("File acess resulted: \(error1)")
print("File acess resulted: \(error2)")
print("File acess resulted: \(error3)")
print("File acess resulted: \(error3.rawValue)")


