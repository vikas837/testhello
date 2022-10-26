//
//  SignUpFormModelValidator.swift
//  TDDTesting
//
//  Created by Vikas Ahuja on 09/10/2022.
//

import Foundation

class SignUpFormModelValidator : SignupModelValidatorProtocol {
    func isLastNameValid(name: String) -> Bool {
        return true
    }
    
    func isEmailValid(email: String) -> Bool {
        return true
    }
    
    func isPasswordValid(password: String) -> Bool {
        return true
    }
    
    
    func isFirstNameValid(firstName:String) -> Bool {
        var returnTrue = true
        
        if firstName.isEmpty {
            return false
        }
        return returnTrue
    }
}
