//
//  AccountSetupViewModel.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""  
    
    func reset() {
        name = ""
        email = ""
        password = ""
    }
    
    func signin(onSuccess: () -> Void, onError: () -> Void) {
        
    }
}
