//
//  Intro.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI

// Main view for the introductory of the app
struct IntroView: View {
    @State private var showNavigationView = false
    
    @StateObject private var navigation = Navigation()
    @StateObject private var signinViewModel = SigninViewModel()
    @StateObject private var forgotPasswordViewModel = ForgotPasswordViewModel()
    
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
                .navigationDestination(for: NavigationEnum.self) { route in
                    route.view()
                        .navigationItemBackButtonTitle("")
                        .environmentObject(signinViewModel)
                        .environmentObject(forgotPasswordViewModel)
                        .environmentObject(navigation)
                }
        }
        .tint(Color.clTextBody)
    }
}

#Preview {
    IntroView()
}
