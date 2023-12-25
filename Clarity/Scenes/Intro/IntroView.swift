//
//  Intro.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI

// Enum for different types of introductory navigation, such as terms and policies
enum IntroNavigationEnum: Hashable {
    case termsConditions
    case termsOfUse
    case privacyPolicy
}

// Observable class to manage navigation routes in the introductory section
final class IntroNavigation: Navigation {
    @Published var routes: [IntroNavigationEnum] = []
}

// Main view for the introductory of the app
struct IntroView: View {
    @StateObject private var navigation = IntroNavigation()
    
    @State private var showNavigationView = false
    
    var body: some View {
        // Initial splash view displayed when the app is opened
        SplashView()
            .onAppear {
                // Delay to show the navigation view after the splash screen
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    showNavigationView = true
                }
            }   // Cover the full screen with navigation view after the splash screen
            .fullScreenCover(isPresented: $showNavigationView) { navigationView }
    }
    
    // Navigation view to handle transitions to different introductory content
    private var navigationView: some View {
        NavigationStack(path: $navigation.routes) {
            PromoView(navigation: navigation)
                .navigationItemBackButtonTitle("")
                .navigationDestination(for: IntroNavigationEnum.self) { route in
                    view(for: route)
                        .navigationItemBackButtonTitle("")
                }
        }
        .tint(Color.clTextBody)
    }
    
    // return the appropriate view based on the selected route
    @ViewBuilder
    private func view(for route: IntroNavigationEnum) -> some View {
        switch route {
            case .termsConditions:
                TermsConditionsView(navigation: navigation)
            case .termsOfUse:
                Text("")
                    .applyPrimaryDesign()
                    .navigationTitle(L10n.Intro.Terms.Button.terms)
            case .privacyPolicy:
                Text("")
                    .applyPrimaryDesign()
                    .navigationTitle(L10n.Intro.Terms.Button.privacy)
        }
    }
}

#Preview {
    IntroView()
}
