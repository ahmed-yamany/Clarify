//
//  View+applyPrimaryDesign.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

extension View {
    // apply primary design for Primary Views
    @ViewBuilder
    func applyPrimaryDesign() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.clBackground)
            .foregroundStyle(Color.clTextPrimary)
            .font(Font.medium(weight: .regular))
    }
}
