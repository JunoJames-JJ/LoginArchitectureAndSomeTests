//
//  LoginArchitectureAndTestsTests.swift
//  LoginArchitectureAndTestsTests
//
//  Created by Jobin Joseph on 2024-06-18.
//

import XCTest
@testable import LoginArchitectureAndTests

final class LoginUseCaseOutputComposerTests: XCTestCase {
    
    func test_composingZeroOutputs() {
        let ut = LoginUseCaseComposerDelegate([])
        ut.loginSuccess()
        ut.loginFailure()
    }
    
    func test_composingMultipleOutputSuccessMessage() {
        let output1 = LoginUseCaseOutputHelper()
        let output2 = LoginUseCaseOutputHelper()

        let ut = LoginUseCaseComposerDelegate([output1,output2 ])
        
        ut.loginSuccess()
        
        XCTAssertEqual(output1.loginSuccessCallCount, 1)
        XCTAssertEqual(output1.loginFailureCallCount, 0)
        
        XCTAssertEqual(output2.loginSuccessCallCount, 1)
        XCTAssertEqual(output2.loginFailureCallCount, 0)

    }
    
    func test_composingMultipleOutputFailureMessage() {
        let output1 = LoginUseCaseOutputHelper()
        let output2 = LoginUseCaseOutputHelper()

        let ut = LoginUseCaseComposerDelegate([output1, output2])
        
        ut.loginFailure()
        
        XCTAssertEqual(output1.loginFailureCallCount, 1)
        XCTAssertEqual(output1.loginSuccessCallCount, 0)
        
        XCTAssertEqual(output2.loginFailureCallCount, 1)
        XCTAssertEqual(output2.loginSuccessCallCount, 0)

    }
    
    private class LoginUseCaseOutputHelper: LoginUseCaseOutput {
       var loginSuccessCallCount = 0
       var loginFailureCallCount = 0
        
        func loginSuccess() {
             loginSuccessCallCount += 1
        }
        func loginFailure() {
            loginFailureCallCount += 1
        }
    }
}
