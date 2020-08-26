//
//  TextFieldModifiers.swift
//  ChatApp
//
//  Created by Duy Bui on 8/26/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    private let isPasswordType: Bool
    private let placeHolderText: String
    
    init(placeHolderText: String, text: Binding<String>, isPasswordType: Bool = false) {
        _text = text
        self.isPasswordType = isPasswordType
        self.placeHolderText = placeHolderText
    }
    var body: some View {
        VStack {
            if isPasswordType {
                SecureField(placeHolderText, text: $text)
                    .textFieldStyle(MyTextFieldStyle())
                
            } else {
                TextField(placeHolderText, text: $text)
                    .textFieldStyle(MyTextFieldStyle())
            }
        }
    }
}

struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 25,
                                 style: .continuous)
                    .stroke(Color.gray, lineWidth: 1)
        )
    }
}

