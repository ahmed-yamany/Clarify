//
//  ForgotPasswordView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

// Define a SwiftUI View for the forgot password screen
struct ForgotPasswordView: View {
    // Environment objects for navigation and view model
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var viewModel: ForgotPasswordViewModel
    
    var body: some View {
        // Use a custom view for the account setup process
        AccountSetupCustomView(subtitle: L10n.AccountSetup.ForgotPassword.subtitle) {
            VStack(spacing: 40) {
                // Text field for email input
                PrimaryTextField(title: L10n.AccountSetup.Signin.Textfield.email,
                                 text: $viewModel.email)
                    .keyboardType(.emailAddress) // Set keyboard type to email
                    .textContentType(.emailAddress) // Set content type to email address

                // Button for forgot password action
                Button(L10n.AccountSetup.ForgotPassword.button) {
                    navigation.navigate(to: .newPassword)
                }
                .buttonStyle(.primaryButton())
            }
            .padding(.top, 40)
        }
        // Set the navigation bar title
        .navigationTitle(L10n.AccountSetup.ForgotPassword.title)
        .onAppear {
            viewModel.reset()
        }
    }
}

#Preview {
    NavigationStack {
        ForgotPasswordView()
            .environmentObject(Navigation())
            .environmentObject(ForgotPasswordViewModel())
    }
}
