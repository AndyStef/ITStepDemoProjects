//
//  UnitTestsExampleTests.swift
//  UnitTestsExampleTests
//
//  Created by Andy Stef on 05.04.2021.
//

import XCTest

class UnitTestsExampleTests: XCTestCase {

    func testExample() {
        // arrange
        let a = 4
        let b = 5
        
        // act
        let result = a + b
        
        // assert
        let expectedResult = 9
        XCTAssertEqual(expectedResult, result)
    }
    
    func test2() {
        
    }
}
