//
//  LoginCrashlyticsTracker.swift
//  LoginArchitectureAndTests
//
//  Created by Jobin Joseph on 2024-06-18.
//

import Foundation

final class LoginCrashlyticsTracker: LoginUseCaseOutput {
    func loginSuccess() {
        // send event to crashlytics
    }
    
    func loginFailure() {
        // send error event to crashltyics
    }
}
