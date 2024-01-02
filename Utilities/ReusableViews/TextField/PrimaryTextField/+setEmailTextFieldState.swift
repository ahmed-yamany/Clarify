//
//  +setEmailTextFieldState.swift
//  Clarity
//
//  Created by Ahmed Yamany on 28/12/2023.
//

import SwiftUI

extension PrimaryTextField {
    @ViewBuilder
    func setEmailTextFieldState(_ email: String) -> some View {
        textfieldState(email.isEmpty ? .none : email.isValidEmail() ? .success : .error)
    }
}
