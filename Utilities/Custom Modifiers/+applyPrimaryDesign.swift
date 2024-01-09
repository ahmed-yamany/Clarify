//
//  View+applyPrimaryDesign.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func applyPrimaryDesign() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.clBackground)
            .foregroundStyle(Color.clTextPrimary)
            .font(Font.medium(weight: .regular))
            .tint(Color.clTextPrimary)
    }
}
