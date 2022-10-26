//
//  MockSignupWebService.swift
//  TDDTestingTests
//
//  Created by Vikas Ahuja on 09/10/2022.
//

import Foundation
@testable import TDDTesting

class MockSignUpWebService: SignUpWebServiceProtocol {
    var isSignupMethodCalled:Bool = false
    
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void) {
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupErrors.failedRequest(description: "Request failed"))
        }else {
            let responseModel = SignupResponseModel(status: "OK")
            completionHandler(responseModel, nil)
        }
    }
}
