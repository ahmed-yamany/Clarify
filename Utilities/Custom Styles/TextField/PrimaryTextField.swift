//
//  PrimaryTextField.swift
//  Clarity
//
//  Created by Ahmed Yamany on 26/12/2023.
//

import SwiftUI

struct PrimaryTextField: View {
    @Environment(\.isFocused) var isFocused
    
    let title: String
    @Binding var text: String
    var secured: Bool = false
    
    @State private var showPassword = true
    
    var body: some View {
        textfield
            .background { prompt }
            .padding(.top, !text.isEmpty ? 12 : 0)
            .padding([.horizontal], 18)
            .frame(height: 56)
            .background(Color.clInputField)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .font(.medium(weight: .regular))
            .animation(.interactiveSpring(duration: 0.6), value: text.isEmpty)
            .overlay(alignment: .trailing) { if secured { showHidePasswordButton } }
            .onAppear { if secured { showPassword = false } }
    }
    
    var textfield: some View {
        Group {
            if showPassword {
                TextField("", text: $text)
            } else {
                SecureField("", text: $text)
            }
        }
    }
    
    var prompt: some View {
        Text(title)
            .foregroundColor(Color.clInputLabel)
            .frame(maxWidth: .infinity, alignment: .leading)
            .offset(y: !text.isEmpty ? -18 : 0)
    }
    
    var showHidePasswordButton: some View {
        Button {
            showPassword.toggle()
        } label: {
            Image(systemName: showPassword ? "eye.slash" : "eye")
        }
        .padding(.trailing, 18)
    }
}
