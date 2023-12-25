//
//  AccountSetupView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

// Enum defining the different states of account setup navigation
enum AccountSetupNavigationEnum: Hashable {
    case signup
    case verifyAccount
    case verifyPhoneNumber
    case verifyEmail
    case signin
    case forotPassword
    case newPassword
    case newPasswordSuccess
}

// Observable class to manage navigation states in the account setup process
class AccountSetupNavigation: Navigation {
    @Published var routes: [AccountSetupNavigationEnum] = []
}

// Main view for account setup, handling different stages of account creation and management
struct AccountSetupView: View {
    @StateObject private var navigation = AccountSetupNavigation()
    
    // ViewModels for different account setup stages
    @StateObject private var signupViewModel = SigninViewModel()
    @StateObject private var signinViewModel = SigninViewModel()
    @StateObject private var forgotPasswordViewModel = ForgotPasswordViewModel()
    
    var body: some View {
        NavigationStack(path: $navigation.routes) {
            parentView
                .applyPrimaryDesign()
                .navigationItemBackButtonTitle("")
                .navigationDestination(for: AccountSetupNavigationEnum.self) { route in
                    view(for: route)
                        .environmentObject(navigation)
                        .navigationItemBackButtonTitle("")
                }
        }
        .tint(Color.clTextBody)
    }
    
    // return the appropriate view based on the current navigation route
    @ViewBuilder
    private func view(for route: AccountSetupNavigationEnum) -> some View {
        switch route {
            case .signup: SigninView()
            case .verifyAccount: VerifyAccountview()
            case .verifyPhoneNumber: VerifyPhoneView()
            case .verifyEmail: VerifyEmailView()
            case .signin: SigninView()
            case .forotPassword: ForgotPasswordView()
            case .newPassword: NewPasswordView()
            case .newPasswordSuccess: NewPasswordSuccessView()
        }
    }
    
    // Parent view holding common components like promotional image and sign-in options
    private var parentView: some View {
        VStack(spacing: 12) {
            PromoAsyncImage(url: Promo.samples.first?.imageUrl)
            appleButton
            googleButton
            notMemberView
        }
        .padding([.horizontal, .top], CGFloat.cl.contentPadding)
        .applyPrimaryDesign()
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
    AccountSetupView()
}
