//
//  User.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import Foundation

struct User: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let age: Int
    let email: String
}

extension User {
    static var sample: User {
        User(id: "123", name: "Ahmed Yamany", age: 22, email: "ahmed.mohammed.yamany@gmail.com")
    }
}
