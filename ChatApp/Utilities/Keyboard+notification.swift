//
//  Keyboard+notification.swift
//  iShop SwiftUI
//
//  Created by iOS App Templates on 02/08/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import UIKit
import SwiftUI


public class KeyboardInfo: ObservableObject {
    
    public static var shared = KeyboardInfo()
    
    @Published public var keyboardIsUp : Bool = false
    @Published public var keyboardHeight : CGFloat = 0
    
    
    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIApplication.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardChanged(notification: Notification) {
        if notification.name == UIApplication.keyboardWillHideNotification {
            withAnimation {
                self.keyboardIsUp = false
            }
        } else {
            withAnimation {
                self.keyboardIsUp = true
            }
        }
    }
}
