//
//  ViewController.swift
//  LoginArchitectureAndTests
//
//  Created by Jobin Joseph on 2024-06-18.
//

import UIKit

protocol LoginUseCaseOutput {
    func loginSuccess()
    func loginFailure()
}

final class LoginUseCase {
    let loginOutput: LoginUseCaseOutput
   
    
    init(loginOutput: LoginUseCaseOutput) {
        self.loginOutput = loginOutput
    }
    
    
    func login(name: String, password: String){
        // if success -> loginOutput.loginSuccess()
        // else -> loginOutput.loginFailure()
    }

}

