//
//  LoginUseCaseComposerDelegate.swift
//  LoginArchitectureAndTests
//
//  Created by Juno James on 2024-06-18.
//

import Foundation

final class LoginUseCaseComposerDelegate: LoginUseCaseOutput {
   
    let loginOutputs: [LoginUseCaseOutput]
    
    init(_ loginOutputs: [LoginUseCaseOutput]) {
        self.loginOutputs = loginOutputs
    }
    func loginSuccess() {
        loginOutputs.forEach{$0.loginSuccess()}
    }
    func loginFailure() {
        loginOutputs.forEach{$0.loginFailure()}
    }
    
}
