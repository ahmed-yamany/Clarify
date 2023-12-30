//
//  String+isValidPassword.swift
//  Clarity
//
//  Created by Ahmed Yamany on 28/12/2023.
//

import Foundation

enum PasswordError: String, Error {
    case tooShort
    case missingUppercase
    case missingLowercase
    case missingDigit
    
    var localizedDescription: String {
        switch self {
        case .tooShort:
            return "Password is too short. It must be at least 8 characters long."
        case .missingUppercase:
            return "Password is missing an uppercase letter."
        case .missingLowercase:
            return "Password is missing a lowercase letter."
        case .missingDigit:
            return "Password is missing a digit."
        }
    }
}

extension String {
    
    @discardableResult
    func isValidPassword() throws -> Bool {
        // Check minimum length
        guard count >= 8 else {
            throw PasswordError.tooShort
        }
        
        // Check for at least one uppercase letter
        let uppercasePredicate = NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*")
        guard uppercasePredicate.evaluate(with: self) else {
            throw PasswordError.missingUppercase
        }
        
        // Check for at least one lowercase letter
        let lowercasePredicate = NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*")
        guard lowercasePredicate.evaluate(with: self) else {
            throw PasswordError.missingLowercase
        }
        
        // Check for at least one digit
        let digitPredicate = NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*")
        guard digitPredicate.evaluate(with: self) else {
            throw PasswordError.missingDigit
        }
        return true
    }
}
