//
//  SignupWebServiceTests.swift
//  TDDTestingTests
//
//  Created by Vikas Ahuja on 08/10/2022.
//

import XCTest
@testable import TDDTesting

class SignupWebServiceTests: XCTestCase {

    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        sut = SignupWebService(urlString: "http:testapp.com", urlSession: urlSession)
        //Act
        signupFormRequestModel = SignupFormRequestModel(firstName: "abc", lastName:"hello", email: "abc@def.com", password: "1234we")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess() {
        //Arrange
       
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
    
        let expectation = self.expectation(description: "Signup web service response expectation")
        
        //Assert
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceiveDifferentJSONResponse_ErrorTookPlace(){
        //Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal server error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        //Act
        
        let expectation = self.expectation(description: "Signup web service response expectation")
        
        //Assert
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            XCTAssertNil(signupResponseModel)
            XCTAssertEqual(error, SignupErrors.ResponseModelParsingError)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
 
    func testSignupWebService_WhenEmptyURLStringProvided_ReturnError(){
        //Arrange
        sut = SignupWebService(urlString: "")
        let expectation = self.expectation(description: "an empty url string expectation")
        //Act
        sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
            XCTAssertEqual(error, SignupErrors.InvalidRequestURLStringError, "signup method did not return expected error")
            XCTAssertNil(signupResponseModel, "When an invalid string url is placed, reponse model must be nil")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
        //Assert
    }
    
//    func testSignupWebService_WhenURLRequestFails_ReturnErrorMessageDescription(){
//        //Arrange
////        let expectation = self.expectation(description: "A failed request expectation")
////        let errorDescription = "A localised Description of errors"
//        MockURLProtocol.error = SignupErrors.failedRequest(description: errorDescription)
//        //Act
////        sut.signup(withForm: signupFormRequestModel) { reasponse, error in
////
////            XCTAssertEqual(error, SignupErrors.failedRequest(description:errorDescription), "The signup method did not return the expected description")
////            XCTAssertEqual(error?.localizedDescription, errorDescription)
////            expectation.fulfill()
////        }
////        self.wait(for: [expectation], timeout: 2)
//        //Assert
//
//    }

}
