//
//  TextSecondaryButtton.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

struct TextSecondaryButtton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: 2)
                    .padding(.bottom, -2)
            }
            .foregroundStyle(configuration.isPressed ? Color.clPrimary.opacity(0.4) : .clTextSecondary)
            .font(Font.Large(weight: .bold))
    }
}

extension ButtonStyle where Self == TextSecondaryButtton {
    static var textSecondary: Self {
        TextSecondaryButtton()
    }
}
