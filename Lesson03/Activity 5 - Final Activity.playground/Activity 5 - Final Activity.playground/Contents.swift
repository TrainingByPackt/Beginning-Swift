//: Playground - noun: a place where people can play

import UIKit

enum CustomerType:String {
    case silver = "SILVER"
    case gold = "GOLD"
    case platinum = "PLATINUM"
}

struct Customer {
    var name: String
    var address: String
    var city: String
    var state: String
    var country: String?
    var type: CustomerType
    
    enum OutputType {
        case label, debug, both
    }

    @discardableResult func printAddress(outputType: OutputType = .label, additionalLines: String?...) -> OutputType {

        switch outputType {
        case .both:
            printDebug()
            fallthrough
        case .label:
            printLabel(additionalLines)
        case .debug:
            printDebug()
        }

        return outputType
    }

    private func printLabel(_ additionalLines: [String?]) {
        var addressString = """
            \(type.rawValue)
            \(name)
            \(address)
            \(city), \(state)
            """

        if let countryText = country {
            addressString += "\n\(countryText)"
        }
        for line in additionalLines {
            if let line = line {
                // "line" and "line" have the same name, but exist in different scopes.
                // The inner 'line' variable is a non-Optional, scoped within this block,
                //and is created only when the Optional 'line' variable created by the for statement is not nil
                addressString += "\n\(line)"
            }
        }

        print(addressString)
    }

    private func printDebug() {
        print(self)
    }

    func customerTuple() -> (String, String, String, String, String?, String) {
        return (name, address, city, state, country, type.rawValue)
    }
}

let customer1 = Customer(name: "John Doe", address: "100 First Street", city: "Springfield", state: "Indiana", country: "USA", type: .platinum)
let customer2 = Customer(name: "Jane Doe", address: "57 Morgan Circle", city: "Las Vegas", state: "Nevada", country: "USA", type: .silver)

let tuple = customer1.customerTuple()
print("Customer named ", tuple.0, " lives in ", tuple.2)

print("===")

customer2.printAddress(outputType: .label, additionalLines: "C/O Sam Johnson", "Forwarding Requested")

print("===")

customer2.printAddress(outputType: .debug)

print("===")

customer1.printAddress(outputType: .both)


