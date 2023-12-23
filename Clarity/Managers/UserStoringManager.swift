//
//  UserStoringManager.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import Foundation

// Responsible for saving getting or deleting the entire auth User
final class UserStoringManager {
    static public let shared = UserStoringManager()
    
    private init() {}
    
    public func save(_ user: User) {
        
    }
    
    public func getUser() -> User? {
        nil
    }
    
    public func deleteUser() {
        
    }
}
