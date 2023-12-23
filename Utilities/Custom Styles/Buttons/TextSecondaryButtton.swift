//
//  TextSecondaryButtton.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

struct TextSecondaryButtton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: 2)
                    .padding(.bottom, -2)
            }
            .foregroundStyle(getBackgroundColor(configuration: configuration))
            .font(Font.Large(weight: .bold))
    }
    
    // Determines the background color of the button based on its configuration
    private func getBackgroundColor(configuration: Configuration) -> Color {
        if configuration.isPressed {
            return Color.clPrimary.opacity(0.4)
        } else if !isEnabled {
            return Color.clInputLabel
        }
        return Color.clTextSecondary
    }
}

extension ButtonStyle where Self == TextSecondaryButtton {
    static var textSecondary: Self {
        TextSecondaryButtton()
    }
}
