//
//  SignupView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var viewModel: SignupViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 48) {
                socialMediaButtons
                textfields
                signinView
            }
            .padding([.horizontal, .top], CGFloat.cl.contentPadding)
            .applyPrimaryDesign()
        }
        .applyPrimaryDesign()
        .navigationTitle("Sign Up")
    }
    
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
    
    var textfields: some View {
        VStack(spacing: 12) {
            PrimaryTextField(title: L10n.AccountSetup.Signup.Textfield.name,
                             text: $viewModel.name)
            
            PrimaryTextField(title: L10n.AccountSetup.Signup.Textfield.email,
                             text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
            
            PrimaryTextField(title: L10n.AccountSetup.Signup.Textfield.password,
                             text: $viewModel.password,
                             secured: true)
            
            Button(L10n.AccountSetup.Signup.Button.signup) {
                
            }
            .buttonStyle(.primaryButton())
        }
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }
    
    private var signinView: some View {
        HStack {
            Text(L10n.AccountSetup.Signup.Text.signin)
                .font(Font.Large(weight: .regular))
            
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
