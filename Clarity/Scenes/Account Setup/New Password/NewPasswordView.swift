//
//  NewPasswordView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

struct NewPasswordView: View {
    // Environment objects for navigation and view model
    @EnvironmentObject var navigation: OnboardingNavigation
    @EnvironmentObject var viewModel: ForgotPasswordViewModel
    
    var body: some View {
        // Use a custom view for the account setup process
        AccountSetupCustomView(subtitle: L10n.AccountSetup.NewPassword.subtitle) {
            VStack(spacing: 68) {
                VStack(spacing: 12) {
                    // Text field for password input
                    PrimaryTextField(title: L10n.AccountSetup.Signin.Textfield.password,
                                     text: $viewModel.password, secured: true)
                    .updateSecuredFieldState(viewModel.password)
                    
                    // Text field for confirm password input
                    PrimaryTextField(title: L10n.AccountSetup.Signin.Textfield.password,
                                     text: $viewModel.confirmPassword, secured: true)
                    .updateSecuredFieldState(viewModel.confirmPassword)
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
            .environmentObject(OnboardingNavigation())
            .environmentObject(ForgotPasswordViewModel())
    }
}
