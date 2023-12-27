//
//  SignupView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

// Define a SwiftUI View for the signup screen
struct SignupView: View {
    // Environment objects for navigation and view model
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var viewModel: SignupViewModel
    
    var body: some View {
        AccountSetupCustomView(subtitle: "") {
            VStack(spacing: 48) {
                socialMediaButtons
                textfields
                signinView
            }
        }
        .navigationTitle(L10n.AccountSetup.Signup.title)
    }
    
    // View for social media sign-in buttons
    var socialMediaButtons: some View {
        VStack(spacing: 8) {
            appleButton
            googleButton
        }
    }
    
    var appleButton: some View {
        Button(L10n.AccountSetup.Button.apple) {
        }
        .buttonStyle(.secondaryButton(icon: .iconApple))
    }
    
    var googleButton: some View {
        Button(L10n.AccountSetup.Button.google) {
        }
        .buttonStyle(.secondaryButton(icon: .iconGoogle))
    }
    
    // View for text fields (name, email, password)
    var textfields: some View {
        VStack(spacing: 12) {
            // Name text field
            PrimaryTextField(title: L10n.AccountSetup.Signup.Textfield.name,
                             text: $viewModel.name)
            
            // Email text field
            PrimaryTextField(title: L10n.AccountSetup.Signup.Textfield.email,
                             text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
            
            // Password text field
            PrimaryTextField(title: L10n.AccountSetup.Signup.Textfield.password,
                             text: $viewModel.password,
                             secured: true)
            
            // Signup button
            Button(L10n.AccountSetup.Signup.Button.signup) {
            }
            .buttonStyle(.primaryButton())
        }
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }
    
    // View for switching to the sign-in screen
    private var signinView: some View {
        HStack {
            // Sign-in text
            Text(L10n.AccountSetup.Signup.Text.signin)
                .font(Font.Large(weight: .regular))
            
            // Button to navigate to sign-in screen
            Button(L10n.Intro.Promo.Button.signin) {
                navigation.navigate(to: .signin)
            }
            .buttonStyle(.textPrimary)
        }
    }
}

#Preview {
    NavigationStack {
        SignupView()
            .environmentObject(SignupViewModel())
            .environmentObject(Navigation())
            .navigationBarTitleDisplayMode(.inline)
    }
}
