//
//  SignupWebService.swift
//  TDDTesting
//
//  Created by Vikas Ahuja on 08/10/2022.
//

import Foundation

class SignupWebService: SignUpWebServiceProtocol{
    private var urlString: String
    private var urlSession: URLSession
    
    init(urlString: String, urlSession: URLSession = .shared){
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignupErrors.InvalidRequestURLStringError)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            
            if let requestError = error {
                completionHandler(nil, SignupErrors.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            }else {
                completionHandler(nil, SignupErrors.ResponseModelParsingError)
            }
                
        }
        dataTask.resume()
    }
}
