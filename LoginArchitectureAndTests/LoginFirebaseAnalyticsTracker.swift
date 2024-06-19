//
//  LoginFirebaseAnalyticsTracker.swift
//  LoginArchitectureAndTests
//
//  Created by Jobin Joseph on 2024-06-18.
//

import Foundation

final class LoginFirebaseAnalyticsTracker: LoginUseCaseOutput {
    func loginSuccess() {
        // send event to firebase
    }
    
    func loginFailure() {
        // send error event to firebase
    }
}
