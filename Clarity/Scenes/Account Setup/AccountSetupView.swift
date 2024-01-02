//
//  AccountSetupView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

// Main view for account setup, handling different stages of account creation and management
struct AccountSetupView: View {
    @ObservedObject var termsAndConditionViewModel: TermsConditionsViewModel
    
    @StateObject private var navigation = OnboardingNavigation()
    // ViewModels for different account setup stages
    @StateObject private var signupViewModel = SignupViewModel()
    @StateObject private var signinViewModel = SigninViewModel()
    @StateObject private var forgotPasswordViewModel = ForgotPasswordViewModel()
    
    var body: some View {
        NavigationStack(path: $navigation.routes) {
            parentView
                .applyPrimaryDesign()
                .navigationItemBackButtonTitle("")
                .navigationDestination(for: NavigationEnum.self) { route in
                    route.view
                        .navigationItemBackButtonTitle("")
                        .environmentObject(navigation)
                        .environmentObject(signupViewModel)
                        .environmentObject(signinViewModel)
                        .environmentObject(forgotPasswordViewModel)
                        .environmentObject(termsAndConditionViewModel)
                }
        }
        .tint(Color.clTextBody)
    }

    // Parent view holding common components like promotional image and sign-in options
    private var parentView: some View {
        VStack(spacing: 12) {
            promoImage
            appleButton
            googleButton
            emailButton
            notMemberView
        }
        .padding([.horizontal, .top], CGFloat.cl.contentPadding)
        .applyPrimaryDesign()
    }
    
    private var promoImage: some View {
        ZStack {
            PromoImage(resource: .imageAccountSetup)
            
            VStack {
                Text(L10n.App.name.uppercased())
                    .font(Font.h3)
                
                Text(L10n.AccountSetup.Image.text)
                    .font(Font.Large(weight: .regular))
            }
            .foregroundStyle(Color.clSecondary)
        }
    }
    
    private var appleButton: some View {
        Button(L10n.AccountSetup.Button.apple) {
        }
        .buttonStyle(.secondaryButton(size: .mediam, icon: .iconApple))
    }
    
    private var googleButton: some View {
        Button(L10n.AccountSetup.Button.google) {
        }
        .buttonStyle(.secondaryButton(size: .mediam, icon: .iconGoogle))
    }
    
    private var emailButton: some View {
        Button(L10n.AccountSetup.Button.email) {
            navigation.navigate(to: .signin)
        }
        .buttonStyle(.primaryButton(size: .mediam, icon: .iconEmail))
    }
    
    // View for users who are not members yet, with a signup button
    private var notMemberView: some View {
        HStack {
            Text(L10n.AccountSetup.Text.notmember)
                .font(Font.Large(weight: .regular))
            
            Button(L10n.AccountSetup.Button.signup) {
                navigation.navigate(to: .signup)
            }
            .buttonStyle(.textPrimary)
        }
    }
}

#Preview {
    AccountSetupView(termsAndConditionViewModel: .init())
}
