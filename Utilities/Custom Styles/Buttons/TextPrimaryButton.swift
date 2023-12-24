//
//  TextPrimaryButton.swift
//  Clarity
//
//  Created by Ahmed Yamany on 24/12/2023.
//

import SwiftUI

struct TextPrimaryButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .offset(y: -2)                    
            }
            .foregroundStyle(getBackgroundColor(configuration: configuration))
    }
    
    // Determines the background color of the button based on its configuration
    private func getBackgroundColor(configuration: Configuration) -> Color {
        if configuration.isPressed {
            return Color.clPrimary.opacity(0.4)
        } else if !isEnabled {
            return Color.clInputLabel
        }
        return Color.clPrimary
    }
}

extension ButtonStyle where Self == TextPrimaryButton {
    static var textPrimary: Self {
        TextPrimaryButton()
    }
}
