import Foundation

class AuthResult {
    
    static let user = AuthResult()
    
    var displayName: String?
    var email: String?
    var creationDate: Date?
    var lastSignInDate: Date?
    
    private init() { }
}
