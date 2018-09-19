//: Create a Variable

import UIKit

let name = "John Doe"
var address = "201 Main Street"
print("\(name) lives at \(address)")

address = "301 Fifth Avenue"
print("\(name) lives at \(address)")

// The following line will generate a compile-time error because 'name' is declard with 'let'
// name = "Richard Doe"


