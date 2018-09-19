//: CustomerStruct.playground

import UIKit

struct CustomerStruct {
    enum CustomerType: String {
        case gold = "Gold Customer!"
        case silver = "Silver Customer!"
        case unknown = "Unknown customer type"
    }
    
    var type: CustomerType?
}

class CustomerClass {
    enum CustomerType: String {
        case gold = "Gold Customer!"
        case silver = "Silver Customer!"
        case unknown = "Unknown customer type"
    }
    
    var type: CustomerType?
    
    init(type:CustomerType) {
        self.type = type
    }
}

var customer1 = CustomerStruct(type: .gold)
print(customer1.type ?? "invalid customer type")

var customer2 = CustomerClass(type: .silver)
print(customer2.type ?? "invalid customer type")

