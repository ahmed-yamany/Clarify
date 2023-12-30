//
//  SigninViewModel.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

class SigninViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func reset() {
        email = ""
        password = ""
    }
    
    func formIsValid() -> Bool {
        email.isValidEmail() && !password.isEmpty
    }
    
    func login(onError: () -> Void = {}) {
        if email.isValidEmail() {
            let user = User(id: "1", name: "Ahmed Yamany", age: 22, email: email)
            AppRouter.shared.login(user)
        } else {
            onError()
        }
    }
}
