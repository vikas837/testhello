//
//  SignUpPresenter.swift
//  TDDTesting
//
//  Created by Vikas Ahuja on 09/10/2022.
//

import Foundation

class SignUpPresenter: SignupPresenterProtocol {
    private var formModelValidator: SignupModelValidatorProtocol
    private var signUpWebService: SignUpWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    required init(formModelValidator: SignupModelValidatorProtocol, webService: SignUpWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.signUpWebService = webService
        self.delegate = delegate
    }
    
    func processUserSignUp(formModel: SignUpFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName){
            return 
        }
        
        if !formModelValidator.isLastNameValid(name: formModel.lastName){
            return
        }
        
        if !formModelValidator.isEmailValid(email: formModel.email){
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password){
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        signUpWebService.signup(withForm: requestModel) { [weak self] response, error in
            
            if let response = response {
                self?.delegate?.successfullSignUp()
                return
            }else{
                self?.delegate?.errorHandler(error: SignupErrors.failedRequest(description: "Request failed"))
                return
            }
        }
    }
}
