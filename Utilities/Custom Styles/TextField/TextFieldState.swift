//
//  TextFieldState.swift
//  Clarity
//
//  Created by Ahmed Yamany on 28/12/2023.
//

import SwiftUI

// Enum to represent different states of a text field
enum TextFieldState: Hashable {
    case none, success, warning, error
    
    // Computed property to determine the fill color based on the state
    var fillColor: Color {
        switch self {
            case .none:
                    .clear
            case .success:
                Color.clPrimary
            case .warning:
                Color.orange
            case .error:
                Color.red
        }
    }
}

// Environment key for storing and retrieving the text field state
struct TextfieldStateKey: EnvironmentKey {
    static var defaultValue: TextFieldState = .none
}

// Extension to easily access and set the text field state in SwiftUI views
extension EnvironmentValues {
    var textfieldState: TextFieldState {
        get { self[TextfieldStateKey.self] }
        set { self[TextfieldStateKey.self] = newValue }
    }
}

extension View {
    // Extension to set the environment value for text field state
    @ViewBuilder
    func textfieldState(_ state: TextFieldState) -> some View {
        environment(\.textfieldState, state)
    }
}
