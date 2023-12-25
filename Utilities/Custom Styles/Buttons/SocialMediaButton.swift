//
//  SocialMediaButton.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

struct SocialMediaButton: ButtonStyle {
    let icon: ImageResource
    // Accesses the environment value that indicates whether the button is enabled or not
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            Image(icon)
                .font(.custom(size: 40, weight: .light))

            configuration
                .label
        }
        .font(Font.Large(weight: .bold))
        .foregroundStyle(Color.clTextSecondary)
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(getBackgroundColor(configuration: configuration))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .background {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 1)
                .foregroundStyle(Color.clSecondary)
        }
    }
    
    // Determines the background color of the button based on its configuration
    private func getBackgroundColor(configuration: Configuration) -> Color {
        if configuration.isPressed {
            return Color.secondary.opacity(0.4)
        } else if !isEnabled {
            return Color.clInputLabel
        }
        return Color.clOtherWhiteToSecondary
    }
}

extension ButtonStyle where Self == SocialMediaButton {
    static func socialMediaButton(icon: ImageResource) -> Self {
        SocialMediaButton(icon: icon)
    }
}
