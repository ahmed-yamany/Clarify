//
//  +updateSecuredFieldState.swift
//  Clarity
//
//  Created by Ahmed Yamany on 28/12/2023.
//

import SwiftUI

// Extension for updating the state of a secured text field
extension PrimaryTextField {
    // Function to update the state and label of the secured text field based on the provided password
    func updateSecuredFieldState( _ password: String) -> some View {
        var state: TextFieldState = .none
        var label: String = ""
        
        // Check if the provided password is not empty
        if !password.isEmpty {
            do {
                try password.isValidPassword()
                state = .success
                label = ""
            } catch let error as PasswordError {
                state = .error
                label = error.localizedDescription
            } catch {
                state = .error
                label = error.localizedDescription
            }
        }
        
        // Set the environment values for text field state and label
        return self.environment(\.textfieldState, state)
            .environment(\.textfieldLabel, label)
    }
}
