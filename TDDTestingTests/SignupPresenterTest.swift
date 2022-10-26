//
//  SignupPresenterTest.swift
//  TDDTestingTests
//
//  Created by Vikas Ahuja on 09/10/2022.
//

import XCTest
@testable import TDDTesting

class SignupPresenterTest: XCTestCase {

    var signupFormModel: SignUpFormModel!
    var mockSignUpFormValidator: MockSignUpFormValidator!
    var mockSignUpWebService: MockSignUpWebService!
    var sut: SignUpPresenter!
    var mockSignUpViewDelegate: MockSignupViewDelegate!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
         signupFormModel = SignUpFormModel(firstName: "abc",
                                              lastName:"ahuja",
                                              email: "abc@gmail.com",
                                              password: "12345")
        
         mockSignUpFormValidator = MockSignUpFormValidator()
         mockSignUpWebService = MockSignUpWebService()
        mockSignUpViewDelegate = MockSignupViewDelegate()
        sut = SignUpPresenter(formModelValidator: mockSignUpFormValidator, webService: mockSignUpWebService, delegate: mockSignUpViewDelegate)
         
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        signupFormModel = nil
        mockSignUpFormValidator = nil
        mockSignUpWebService = nil
        sut = nil
        mockSignUpViewDelegate = nil
    }
    
    func testSignupPresenter_WhenInformationIsPRovides_WillValidateEachProperty() {
        //arrange
        //Act
        
        sut.processUserSignUp(formModel: signupFormModel)
        //Assert
        XCTAssertTrue(mockSignUpFormValidator.isFirstNameValidated, "First Name not validated")
        XCTAssertTrue(mockSignUpFormValidator.isLastNameValidated, "Last Name not validated")
        XCTAssertTrue(mockSignUpFormValidator.isEmailValidated, "Email not validated")
        XCTAssertTrue(mockSignUpFormValidator.isPasswordValidated, "password not validated")
    }

    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        //Arrange
        //Act
        
        sut.processUserSignUp(formModel: signupFormModel)
        
        //Assert
        
        XCTAssertTrue(mockSignUpWebService.isSignupMethodCalled, "Signupmethod not called in the signupWeb Service")
        
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessfull_CallSuccessOnViewDelegate() {
        //Arrange
        let myExpectation = expectation(description: "Successfull signup method to be called")

       
        mockSignUpViewDelegate.expectations = myExpectation
    
        //Act
        sut.processUserSignUp(formModel: signupFormModel)
        
        self.wait(for: [myExpectation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignUpViewDelegate.successfullSignUpCpunter, 1, "Successfull signup method called more than once")
    }
    
    func testSignupPresenter_WhenSignupOperationGivesError_CallErrorOnViewDelegate () {
        //Arrange
        let expectation = expectation(description: "Error should get called")
        mockSignUpViewDelegate.errorExpectation = expectation
        mockSignUpWebService.shouldReturnError = true
       
        //Act
        sut.processUserSignUp(formModel: signupFormModel)
        self.wait(for: [expectation], timeout: 5)
        //Assert
        XCTAssertEqual(mockSignUpViewDelegate.errorShouldCalledOnce, 1)
        XCTAssertEqual(mockSignUpViewDelegate.successfullSignUpCpunter, 0)
        XCTAssertNotNil(mockSignUpViewDelegate.signupError)
    }
    
    
}
