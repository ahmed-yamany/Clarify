//
//  NewPasswordView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

struct NewPasswordView: View {
    // Environment objects for navigation and view model
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var viewModel: ForgotPasswordViewModel
    
    var body: some View {
        // Use a custom view for the account setup process
        AccountSetupCustomView(subtitle: L10n.AccountSetup.NewPassword.subtitle) {
            VStack(spacing: 68) {
                VStack(spacing: 12) {
                    // Text field for email input
                    PrimaryTextField(title: L10n.AccountSetup.Signin.Textfield.password,
                                     text: $viewModel.password, secured: true)
                    PrimaryTextField(title: L10n.AccountSetup.Signin.Textfield.password,
                                     text: $viewModel.confirmPassword, secured: true)
                }
                
                // Button for forgot password action
                Button(L10n.AccountSetup.NewPassword.button) {
                    navigation.navigate(to: .newPasswordSuccess)
                }
                .buttonStyle(.primaryButton())
            }
            .padding(.top, 40)
        }
        // Set the navigation bar title
        .navigationTitle(L10n.AccountSetup.NewPassword.title)
    }
}

#Preview {
    NavigationStack {
        NewPasswordView()
            .environmentObject(Navigation())
            .environmentObject(ForgotPasswordViewModel())
    }
}
