//
//  ErrorHandler.swift
//  iShop SwiftUI
//
//  Created by iOS App Templates on 02/08/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import Foundation
import Firebase

extension AuthErrorCode {
    var stringValue: String {
        switch self {
        case .emailAlreadyInUse:
            return "User exists! Please try again"
        case .invalidEmail:
            return "Please enter a valid email ID"
        case .userNotFound:
            return "No Account found. signup to continue"
        case .networkError:
            return "No internet"
        case .wrongPassword:
            return "Password invalid"
        case .weakPassword:
            return "Password should have minimum 6 characters"
        default:
            print("Error")
            return "please try again later"
        }
    }
}



extension Error {
    var authErrorValue : String{
        let errorcode = AuthErrorCode(rawValue: self._code)
        return errorcode!.stringValue
    }
}

