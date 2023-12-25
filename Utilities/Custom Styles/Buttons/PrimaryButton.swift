//
//  PrimaryButton.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

enum ButtonSize {
    case large, mediam, small
    
    var height: CGFloat {
        switch self {
            case .large: 60
            case .mediam: 48
            case .small: 38
        }
    }
}

/**
 Custom SwiftUI ButtonStyle for a primary button with a bold font and rounded corners.

 Usage:
 ```swift
 Button("Tap me") {
  // Button action
 }
  .buttonStyle(.primaryButton)
 ```
 */

struct PrimaryButton: ButtonStyle {
    let buttonSize: ButtonSize
    var icon: ImageResource?
    // Accesses the environment value that indicates whether the button is enabled or not
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            if let icon {
                Image(icon)
                    .font(.custom(size: 40, weight: .light))
            }
            
            configuration
                .label
        }
        .font(Font.Large(weight: .bold))
        .foregroundStyle(Color.clWhite)
        .frame(maxWidth: .infinity)
        .frame(height: buttonSize.height)
        .background(getBackgroundColor(configuration: configuration))
        .clipShape(RoundedRectangle(cornerRadius: 12))
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

extension ButtonStyle where Self == PrimaryButton {
    static func primaryButton(size buttonSize: ButtonSize = .large, icon: ImageResource? = nil) -> Self {
        PrimaryButton(buttonSize: buttonSize, icon: icon)
    }
}
