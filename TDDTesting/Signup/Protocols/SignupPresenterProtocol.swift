//
//  SignupPresenterProtocol.swift
//  TDDTesting
//
//  Created by Vikas Ahuja on 10/10/2022.
//

import Foundation

protocol SignupPresenterProtocol {
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignUpWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    func processUserSignUp(formModel: SignUpFormModel)
}
