//
//  UserStoringManager.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import Foundation

extension UserDefaultsKeys {
    var user: String { "clarity-user" }
}

// Responsible for saving getting or deleting the entire auth User
final class UserStoringManager {
    static public let shared = UserStoringManager()
    @UserDefault<User>(key: \.user) var user
    
    private init() {}
    
    public func save(_ user: User) {
        self.user = user
    }
    
    public func getUser() -> User? {
        user
    }
    
    public func deleteUser() {
        UserDefaults.standard.reset(keys: [UserDefaultsKeys.shared.user])
    }
}
