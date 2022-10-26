//
//  SignupViewControllerTest.swift
//  TDDTestingTests
//
//  Created by Vikas Ahuja on 09/10/2022.
//

import XCTest
@testable import TDDTesting

class SignupViewControllerTest: XCTestCase {

    var storeyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storeyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storeyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        //Act
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        storeyboard = nil
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpViewController_WhenCreated_TextFieldShouldEmpty() throws {
       //Arrange
        
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "first name text field is not connected to the outlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "last name text field is not connected to the outlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "email text field is not connected to the outlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "password text field is not connected to the outlet")
        
        //Assert
        XCTAssertEqual(firstNameTextField.text, "", "First name text field was not empty when loaded")
        XCTAssertEqual(lastNameTextField.text, "", "last name text field was not empty when loaded")
        XCTAssertEqual(emailTextField.text, "", "email was not empty when loaded")
        XCTAssertEqual(passwordTextField.text, "", "password was not loaded when loaded")
    }
    
    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "signup button is not connected to outlet")
        
        let actions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button has no connections")
        
        XCTAssertEqual(actions.count, 1)
        XCTAssertEqual(actions.first, "signupButtonTapped:", "There is not action with a name signupbutton tapped assigned in the group")
    }
    
    func testSignupViewController_WhenSignupButtonTapped_InvokesSignupProcess(){
        //arrange
        let mockSignupModelValidator = MockSignUpFormValidator()
        let mockSignupWebServiceProtocol = MockSignUpWebService()
        let mockSignupDelegateProtocol = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebServiceProtocol, delegate: mockSignupDelegateProtocol)
        sut.signupPresenter = mockSignupPresenter
        //act
        sut.signupButton.sendActions(for: .touchUpInside)
        //assert
        XCTAssertTrue(mockSignupPresenter.signupProcessCalled, "signup process not started")
    }
}
