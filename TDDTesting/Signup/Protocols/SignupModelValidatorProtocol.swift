//
//  SignupModelValidatorProtocol.swift
//  TDDTesting
//
//  Created by Vikas Ahuja on 09/10/2022.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(firstName:String) -> Bool
    func isLastNameValid(name:String) -> Bool
    func isEmailValid(email:String) -> Bool
    func isPasswordValid(password:String) -> Bool
}
