//
//  Navigation.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

// Observable class managing the navigation stack in the application
class Navigation<Enum: Equatable>: ObservableObject {
    @Published var routes: [Enum] = [] // Stack of navigation routes
    // Function to navigate to a specific route
    func navigate(to route: Enum) {
        routes.append(route)
    }
    
    // Function to return to the root of the navigation stack
    func popToRoot() {
        routes = []
    }
    
    // Function to pop the navigation stack up to a specified route
      func pop(to route: Enum) {
          // Check if the route exists in the stack
          if let index = routes.lastIndex(where: { $0 == route }) {
              // Remove routes above the specified route
              routes = Array(routes.prefix(upTo: index + 1))
          }
      }
}

// Enumeration for various navigation states in the application
enum NavigationEnum: Hashable {
    case termsConditions
    case termsOfUse
    case privacyPolicy
    case signup
    case verifyAccount
    case verifyPhoneNumber
    case verifyEmail
    case signin
    case forotPassword
    case newPassword
    case newPasswordSuccess
    
    @ViewBuilder
    var view: some View {
        switch self {
            case .termsConditions: TermsConditionsView()
            case .termsOfUse: TermsView()
            case .privacyPolicy: PrivacyPolicyView()
            case .signup: SignupView()
            case .verifyAccount: VerifyAccountview()
            case .verifyPhoneNumber: VerifyPhoneView()
            case .verifyEmail: VerifyEmailView()
            case .signin: SigninView()
            case .forotPassword: ForgotPasswordView()
            case .newPassword: NewPasswordView()
            case .newPasswordSuccess: NewPasswordSuccessView()
        }
    }
}

class OnboardingNavigation: Navigation<NavigationEnum> { }
