//
//  SignupViewController.swift
//  TDDTesting
//
//  Created by Vikas Ahuja on 09/10/2022.
//

import Foundation
import UIKit

class SignupViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    //MARK: VARIABLES
    var signupPresenter: SignupPresenterProtocol?
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        if signupPresenter == nil {
            let signupFormValidator = SignUpFormModelValidator()
            let signupWebService = SignupWebService(urlString: "http://Signup.com")
            
            signupPresenter = SignUpPresenter(formModelValidator: signupFormValidator, webService: signupWebService, delegate: self)
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let signupFormModel = SignUpFormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        signupPresenter?.processUserSignUp(formModel: signupFormModel)
    }
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfullSignUp() {
        //TODO:
    }
    
    func errorHandler(error: SignupErrors) {
        //TODO:
    }
    
    
}



