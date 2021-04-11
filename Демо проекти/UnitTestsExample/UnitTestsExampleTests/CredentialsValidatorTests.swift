//
//  CredentialsValidatorTests.swift
//  UnitTestsExampleTests
//
//  Created by Andy Stef on 05.04.2021.
//

import XCTest
@testable import UnitTestsExample

class CredentialsValidatorTests: XCTestCase {
    
    let sut = CredentialsValidator(emailRegexProvider: MockEmailRegexProvider())
    
    func testValidatesGoodPassword() {
        // arrange
        let goodPassword = "qwertyui12" // 10 chars
        
        // act
        let validationResult = sut.check(goodPassword)
        
        // assert
        XCTAssertTrue(validationResult)
    }
    
    func testShortPassword() {
        let shortPassword = "qwer"
        
        let validationResult = sut.check(shortPassword)
        
        XCTAssertFalse(validationResult)
    }
    
    func testMinimalCharactersPassword() {
        let eightCharPassword = "qwertyu1"
        
        let validationResult = sut.check(eightCharPassword)
        
        XCTAssertTrue(validationResult)
    }
    
    func testNotValidatingPasswordWithoutDigits() {
        let passwordWithoutDigits = "qwertyuiqw"
        
        let validationResult = sut.check(passwordWithoutDigits)
        
        XCTAssertFalse(validationResult)
    }
    
    func testValidatesPasswordWithDigits() {
        let passwordWithDigits = "qwertyuiqw12"
        
        let validationResult = sut.check(passwordWithDigits)
        
        XCTAssertTrue(validationResult)
    }
    
    func testNotValidatingBadEmail() {
        let badEmail = "test@"
        
        let result = sut.check(email: badEmail)
        
        XCTAssertFalse(result)
    }
    
    func testValidatesGoodEmail() {
        let goodEmail = "test@gmail.com"
        
        let result = sut.check(email: goodEmail)
        
        XCTAssertTrue(result)
    }
}

class MockEmailRegexProvider: EmailRegexProvider {
    func getRegex() -> String {
        return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    }
}
