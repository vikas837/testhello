//
//  SignupViewDelegatePRotocol.swift
//  TDDTesting
//
//  Created by Vikas Ahuja on 09/10/2022.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignUp()
    func errorHandler(error: SignupErrors)
}
