//
//  PrimaryTextField.swift
//  Clarity
//
//  Created by Ahmed Yamany on 26/12/2023.
//

import SwiftUI

// Environment key for storing and retrieving the text field label
struct TextfieldLabelKey: EnvironmentKey {
    static var defaultValue: String = ""
}

extension EnvironmentValues {
    // Extension to easily access and set the text field label in SwiftUI views
    var textfieldLabel: String {
        get { self[TextfieldLabelKey.self] }
        set { self[TextfieldLabelKey.self] = newValue }
    }
}

// Custom SwiftUI text field with additional features
struct PrimaryTextField: View {
    @Environment(\.isFocused) private var isFocused
    @Environment(\.textfieldState) private var state
    @Environment(\.textfieldLabel) private var label: String
    
    let title: String
    @Binding var text: String
    var secured: Bool = false
    
    @State private var showPassword = true
    
    var body: some View {
        VStack {
            textfield
                .background { prompt }
                .padding(.top, !text.isEmpty ? 12 : 0)
                .padding([.horizontal], 18)
                .frame(height: 56)
                .background(Color.clInputField)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 2)
                        .fill(state.fillColor)
                }
                .font(.medium(weight: .regular))
                .animation(.interactiveSpring(duration: 0.6), value: text.isEmpty)
                .overlay(alignment: .trailing) { if secured { showHidePasswordButton } }
                .onAppear { if secured { showPassword = false } }
            
            if !label.isEmpty {
                Text(label)
                    .font(.small(weight: .medium))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .animation(.smooth, value: label)
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

#Preview {
    NavigationStack {
        SignupView()
            .environmentObject(SignupViewModel())
            .environmentObject(Navigation())
            .navigationBarTitleDisplayMode(.inline)
    }
}
