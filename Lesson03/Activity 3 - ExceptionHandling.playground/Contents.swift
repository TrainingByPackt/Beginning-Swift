//: ExceptionHandling.playground

import UIKit
import Foundation

struct UserInfo : Codable {
    var name: String
    var email: String
    var userId: String
}

func decodeJson(jsonText: String) {
    if let data = jsonText.data(using: String.Encoding.utf8) {
        let decoder = JSONDecoder()
        
        do {
            let userObject =
                try decoder.decode(UserInfo.self, from: data)
            
            print("User decoded form JSON: \(userObject)")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    print("program always continues from this point.")
}

decodeJson(jsonText : "{ \name\" : \"John Smith\", \"email\" : \"john@smith.com\", \"userId\" : \"jsmith\"}")

// The following implementation uses multiple catch blocks
func decodeJson2(jsonText: String) {
    if let data = jsonText.data(using: String.Encoding.utf8) {
        let decoder = JSONDecoder()
        
        do {
            let userObject = try decoder.decode(UserInfo.self,
                                                from: data)
            print("User decoded form JSON: \(userObject)")
        } catch let DecodingError.typeMismatch(_, context) {
            print("Type Mismatch Error: \(context.debugDescription)")
        } catch let DecodingError.dataCorrupted(context) {
            print("Decoding Error: \(context.debugDescription)")
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("program always continues from this point.")
    }
}
print("####")
decodeJson2(jsonText : " \"name\" : \"John Smith\", \"email\" : \"john@smith.com\", \"userId\" : \"jsmith\"}")
