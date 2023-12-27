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
}
