//
//  Navigation.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

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
    
    // Provides the corresponding view for each navigation state
    @ViewBuilder
    func view() -> some View {
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

// Observable class managing the navigation stack in the application
class Navigation: ObservableObject {
    @Published var routes: [NavigationEnum] = [] // Stack of navigation routes
    
    // Function to navigate to a specific route
    func navigate(to route: NavigationEnum) {
        routes.append(route)
    }
    
    // Function to return to the root of the navigation stack
    func popToRoot() {
        routes = []
    }
    
    // Function to pop the navigation stack up to a specified route
      func pop(to route: NavigationEnum) {
          // Check if the route exists in the stack
          if let index = routes.lastIndex(where: { $0 == route }) {
              // Remove routes above the specified route
              routes = Array(routes.prefix(upTo: index + 1))
          }
      }
}
