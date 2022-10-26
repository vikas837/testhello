//
//  FileSignupWebServiceProtocol.swift
//  TDDTesting
//
//  Created by Vikas Ahuja on 09/10/2022.
//

import Foundation

protocol SignUpWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void)
}
