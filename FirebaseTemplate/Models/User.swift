
import Foundation
import FirebaseFirestore
import class Firebase.User
typealias FirebaseUser = Firebase.User


struct User: Codable{
    var fullName: String = ""
    var email: String = ""
    var phoneNumber: String = ""
    var gender: String = ""
    var birthDate: Date = Date()
    var civilIdNumber: String = ""
}



struct SignInCredentials: Encodable
{
    var email: String
    var password: String
}
