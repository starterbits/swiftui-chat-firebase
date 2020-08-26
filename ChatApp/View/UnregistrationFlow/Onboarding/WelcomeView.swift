//
//  WelcomeView.swift
//  ChatApp
//
//  Created by Duy Bui on 8/26/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    @State private var index = 1
    @State private var pushActive = false
    @EnvironmentObject var state : AppState
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: destinationView(),
                               isActive: self.$pushActive) {
                                EmptyView()
                }
                .navigationBarHidden(true)
                
                VStack(spacing: 40) {
                    Image("logo")
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                        .colorMultiply(Color(UIConfiguration.tintColor))
                    
                    Text("Welcome to your app")
                        .modifier(TextModifier(font: UIConfiguration.titleFont,
                                               color: UIConfiguration.tintColor))
                    
                    Text("Start your iOS app with this Firebase SwiftUI ChatApp Kit")
                        .modifier(TextModifier(font: UIConfiguration.subtitleFont))
                        .padding(.horizontal, 60)
                    
                    VStack(spacing: 25) {
                        CustomButton(title: "Log In") {
                            self.index = 1
                            self.pushActive = true
                        }
                        
                        
                        Button(action: {
                            self.index = 2
                            self.pushActive = true
                        }) {
                            Text("Sign Up")
                                .modifier(TextModifier(font: UIConfiguration.buttonFont,
                                                       color: .black))
                                .frame(width: 275, height: 55)
                                .overlay(RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }
                    }
                }
                Spacer()
            }
        }
    }
    
    private func destinationView() -> AnyView {
        switch index {
        case 1:
            return AnyView(SignInView())
        default:
            return AnyView(SignUpView())
        }
    }
}
