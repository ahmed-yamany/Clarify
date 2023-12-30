//
//  SigninView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

struct SigninView: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var viewModel: SigninViewModel
    
    var body: some View {
        AccountSetupCustomView(subtitle: L10n.AccountSetup.Signin.subtitle) {
            VStack(spacing: 48) {
                socialMediaButtons
                textfields
                signupView
            }
        }
        .navigationTitle(L10n.AccountSetup.Signin.title)
        .onAppear {
            viewModel.reset()
        }
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
            emailTextfield
            passwordTextField
            signinButton
            forgotPassword
        }
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }
    
    private var emailTextfield: some View {
        PrimaryTextField(title: L10n.AccountSetup.Signin.Textfield.email,
                         text: $viewModel.email)
        .setEmailTextFieldState(viewModel.email)
        .keyboardType(.emailAddress)
        .textContentType(.emailAddress)
    }
    
    private var passwordTextField: some View {
        PrimaryTextField(title: L10n.AccountSetup.Signin.Textfield.password,
                         text: $viewModel.password,
                         secured: true)
    }
    
    private var signinButton: some View {
        Button(L10n.AccountSetup.Signin.Button.signin) {
            viewModel.login()
        }
        .buttonStyle(.primaryButton())
        .disabled(!viewModel.formIsValid())
    }
    
    private var forgotPassword: some View {
        Button(L10n.AccountSetup.Signin.Button.forgorPassword) {
            navigation.navigate(to: .forotPassword)
        }
        .buttonStyle(.textPrimary)
    }
    
    // View for switching to the sign-up screen
    private var signupView: some View {
        HStack {
            // Sign-up text
            Text(L10n.AccountSetup.Signin.Text.signup)
                .font(Font.Large(weight: .regular))
            
            // Button to navigate to sign-up screen
            Button(L10n.AccountSetup.Signup.title) {
                navigation.navigate(to: .signup)
            }
            .buttonStyle(.textPrimary)
        }
    }
}

#Preview {
    NavigationStack {
        NavigationLink {
            
        } label: {
            SigninView()
                .environmentObject(Navigation())
                .environmentObject(SigninViewModel())
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
