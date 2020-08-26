//
//  SignInViewModel.swift
//  ChatApp
//
//  Created by Duy Bui on 8/26/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var error: String = ""
    @Published var isAlertShown = false
    
    func signIn(with state: AppState) {
        if let error = emptyValidation() {
            self.error = error
            self.isAlertShown = true
            return
        }
        
        state.signIn(email: email,
                     password: password) { (result, error) in
                        if let error = error {
                            self.error = error.authErrorValue
                            self.isAlertShown = true
                            return
                        }
                        self.email = ""
                        self.password = ""
        }
    }
    
    func emptyValidation() -> String? {
        if email.isReallyEmpty || password.isReallyEmpty {
            return "Please complete all the required fields"
        }
        return nil
    }
}
