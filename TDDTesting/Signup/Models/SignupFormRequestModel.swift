//
//  SignupFormRequestModel.swift
//  TDDTesting
//
//  Created by Vikas Ahuja on 08/10/2022.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
