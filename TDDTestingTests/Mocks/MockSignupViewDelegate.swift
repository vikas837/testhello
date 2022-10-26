//
//  MockSignupViewDelegate.swift
//  TDDTestingTests
//
//  Created by Vikas Ahuja on 09/10/2022.
//

import Foundation
import XCTest
@testable import TDDTesting

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectations: XCTestExpectation?
    var errorExpectation: XCTestExpectation?
    var errorShouldCalledOnce = 0
    var successfullSignUpCpunter = 0
    var signupError: SignupErrors?
   
    func successfullSignUp() {
        successfullSignUpCpunter += 1
        expectations?.fulfill()
    }
    
    func errorHandler(error: SignupErrors) {
        signupError = error
        errorShouldCalledOnce += 1
        errorExpectation?.fulfill()
    }
}
