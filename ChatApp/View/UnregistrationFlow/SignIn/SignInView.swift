//
//  ContentView.swift
//  ChatApp
//
//  Created by iOS App Templates on 02/08/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var state: AppState
    @ObservedObject private var viewModel: SignInViewModel
    
    init() {
        viewModel = SignInViewModel()
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 40) {
                VStack(alignment: .leading, spacing: 30) {
                    Text("Log in")
                        .modifier(TextModifier(font: UIConfiguration.titleFont,
                                               color: UIConfiguration.tintColor))
                        .padding(.leading, 25)
                        .padding(.bottom, 80)
                    VStack(alignment: .center, spacing: 30) {
                        CustomTextField(placeHolderText: "E-mail",
                                        text: $viewModel.email)
                        CustomTextField(placeHolderText: "Password",
                                        text: $viewModel.password,
                                        isPasswordType: true)
                    }.padding(.horizontal, 25)
                }
                VStack(alignment: .center, spacing: 15) {
                    CustomButton(title: "Log In",
                                 action: { self.viewModel.signIn(with: self.state) })
                    HStack {
                        Text("Don't have an account yet?")
                            .modifier(TextModifier(font: UIConfiguration.subtitleFont))
                        NavigationLink(destination: SignUpView()) {
                            Text("Create an account")
                                .modifier(TextModifier(font: UIConfiguration.subtitleFont,
                                                       color: UIConfiguration.tintColor))
                        }
                        
                    }
                }
                Spacer()
            }.alert(isPresented: $viewModel.isAlertShown) {
                Alert(title: Text("Ops, something went wrong!"),
                      message: Text(viewModel.error),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}
