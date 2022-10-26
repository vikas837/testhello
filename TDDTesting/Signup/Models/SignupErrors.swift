//
//  SignupErrors.swift
//  TDDTesting
//
//  Created by Vikas Ahuja on 08/10/2022.
//

import Foundation

enum SignupErrors: LocalizedError, Equatable {
    case ResponseModelParsingError
    case InvalidRequestURLStringError
    case failedRequest(description:String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .InvalidRequestURLStringError, .ResponseModelParsingError:
            return ""
        }
    }
}
