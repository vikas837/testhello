//
//  MockSignupPresenter.swift
//  TDDTestingTests
//
//  Created by Vikas Ahuja on 10/10/2022.
//

import Foundation
@testable import TDDTesting

class MockSignupPresenter: SignupPresenterProtocol {
    var signupProcessCalled: Bool = false
    required init(formModelValidator: SignupModelValidatorProtocol, webService: SignUpWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        //TODO
    }
    
    func processUserSignUp(formModel: SignUpFormModel) {
        signupProcessCalled = true
    }
}
