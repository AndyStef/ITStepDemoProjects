//
//  CredentialsValidator.swift
//  UnitTestsExample
//
//  Created by Andy Stef on 05.04.2021.
//

import Foundation

class CredentialsValidator {
    
    struct Constants {
        static let minimumPasswordLenght = 8
    }
    
    private let emailRegexProvider: EmailRegexProvider
    
    init(emailRegexProvider: EmailRegexProvider) {
        self.emailRegexProvider = emailRegexProvider
    }
    
    func check(_ password: String) -> Bool {
        guard password.count >= Constants.minimumPasswordLenght else {
            return false
        }
        
        let digitsCharacters = CharacterSet.decimalDigits
        let decimalRange = password.rangeOfCharacter(from: digitsCharacters)
        guard decimalRange != nil else {
            return false
        }
        
        return true
    }
    
    func check(email: String) -> Bool {
        let emailRegex = emailRegexProvider.getRegex()
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

protocol EmailRegexProvider {
    func getRegex() -> String
}

class NetworkEmailRegexProvider: EmailRegexProvider {
    func getRegex() -> String {
        // get regex from Backend
        return ""
    }
}
