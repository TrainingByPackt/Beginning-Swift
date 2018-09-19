//: Using Optionals

import UIKit

// create an optional variable with an initial value of nil
var name: String? = nil

if name == nil {
    print("name is nil")
} else {
    print("name is not nil")
}

name = "John Doe"
if let n = name {
    print(n)
} else {
    print("the name is still nil")
}


