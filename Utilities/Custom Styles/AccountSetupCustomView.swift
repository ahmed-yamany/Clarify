//
//  AccountSetupCustomView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 27/12/2023.
//

import SwiftUI

// Define a generic SwiftUI View for account setup screens
struct AccountSetupCustomView<Content: View>: View {
    // Subtitle for the view
    let subtitle: String
    
    // Content closure that returns a View
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Title view with the subtitle
                titleView
                // Custom content passed to the view
                content()
            }
            .padding([.horizontal], CGFloat.cl.contentPadding)
            .applyPrimaryDesign()
        }
        .applyPrimaryDesign()
        .navigationBarTitleDisplayMode(.large)
    }
    
    // Title view with the subtitle text
    var titleView: some View {
        Text(subtitle)
            .font(.Large(weight: .regular))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    AccountSetupCustomView(subtitle: "Use the same method that you create your account with.") { }
}
