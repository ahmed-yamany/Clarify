//
//  PrimaryToggleStyle.swift
//  Clarity
//
//  Created by Ahmed Yamany on 24/12/2023.
//

import SwiftUI

struct PrimaryToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top, spacing: 18) {
            image(configuration)
            
            configuration.label
        }
    }
    
    private func image(_ configuration: Configuration) -> some View {
        Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundStyle(configuration.isOn ? Color.clPrimary : Color.clTextBody)
            .background { configuration.isOn ? Color.clWhite.frame(width: 12, height: 12) : nil }
            .onTapGesture {
                configuration.isOn.toggle()
            }
    }
}

extension ToggleStyle where Self == PrimaryToggleStyle {
    static var primary: Self {
        PrimaryToggleStyle()
    }
}
