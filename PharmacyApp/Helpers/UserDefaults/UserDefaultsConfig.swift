
import Foundation

public struct UserDefaultsConfig {
    
    @UserDefault("userName", defaultValue: nil)
    static var userName: String?
    
    @UserDefault("token", defaultValue: nil)
    static var token: String?
    
}
