//: Playground - noun: a place where people can play

import UIKit

func buildAddress(_ name: String, address: String, city: String, zipCode postalCode: String, country: String? = "USA") -> String {
    
    return """
        \(name)
        \(address)
        \(city)
        \(postalCode)
        \(country ?? "")
    """
}

print(buildAddress("John Doe", address: "5 Covington Square", city: "Birmingham", zipCode: "01234"))
print("=====")
print(buildAddress("John Doe", address: "5 Covington Square", city: "Birmingham", zipCode: "01234", country: nil))
