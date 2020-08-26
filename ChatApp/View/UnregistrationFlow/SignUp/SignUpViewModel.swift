//
//  SignUpViewModel.swift
//  ChatApp
//
//  Created by Duy Bui on 8/26/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var confirmPassword: String = ""
    @Published var error: String = ""
    @Published var isAlertShown = false
    @Published var selectedImage : UIImage?
    @Published var profileImage : Image?
    
    func signUp(with state: AppState) {
        if let error = validationsCheck() {
            self.error = error
            self.isAlertShown = true
            return
        }
        
        state.signUp(email: email,
                     password: password) { (result, error) in
                        if let error = error {
                            self.error = error.authErrorValue
                            self.isAlertShown = true
                            return
                        }
                        
                        guard let result = result else { return }
                        
                        state.createUser(user: UserData(email: self.email,
                                                        name: self.name,
                                                        profileImageUrl: "default",
                                                        id: result.user.uid))
                        guard let inputImage = self.selectedImage else { return}
                        state.createProfile(inputImage)
                        self.email = ""
                        self.password = ""
        }
    }
    
    func validationsCheck() -> String? {
        if email.isReallyEmpty ||
            password.isReallyEmpty ||
            confirmPassword.isReallyEmpty ||
            name.isReallyEmpty {
            return "Please Fill in all the fields"
        }
        if password != confirmPassword {
            return "Your confirmed passwords is incorrect"
        }
        return nil
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return}
        profileImage = Image(uiImage: selectedImage)
    }
}
