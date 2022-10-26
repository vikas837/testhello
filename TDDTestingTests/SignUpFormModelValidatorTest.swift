//
//  SignUpFormModelValidatorTest.swift
//  TDDTestingTests
//
//  Created by Vikas Ahuja on 09/10/2022.
//

import XCTest
@testable import TDDTesting

class SignUpFormModelValidatorTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpFormValidator_WhenValidFirstNameIsProvides_ShoulsReturnTrue(){
        //Arrange
        let sut = SignUpFormModelValidator()
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "test")
        //Assert
        XCTAssertTrue(isFirstNameValid, "is firstnameValid should have return true but return false")
    }
}
