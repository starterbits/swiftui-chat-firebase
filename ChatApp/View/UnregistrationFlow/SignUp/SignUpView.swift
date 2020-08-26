//
//  SignUpView.swift
//  ChatApp
//
//  Created by iOS App Templates on 02/08/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var state: AppState
    @State private var isImagePickerShown = false
    @State private var isActionSheetShown = false
    @State private var imagePickerType = UIImagePickerController.SourceType.photoLibrary
    @ObservedObject private var viewModel: SignUpViewModel
    
    init() {
        viewModel = SignUpViewModel()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack{
                if viewModel.profileImage != nil {
                    viewModel.profileImage!
                        .avatarModifier()
                        .onTapGesture {
                            self.isActionSheetShown = true
                    }
                } else {
                    Image("default")
                        .avatarModifier()
                        .onTapGesture {
                            self.isActionSheetShown = true
                    }
                }
            }
            
            VStack(spacing: 20) {
                VStack(alignment: .center, spacing: 30) {
                    VStack(alignment: .center, spacing: 25) {
                        CustomTextField(placeHolderText: "Full Name",
                                      text: $viewModel.name)
                        CustomTextField(placeHolderText: "E-mail Address",
                                      text: $viewModel.email)
                        CustomTextField(placeHolderText: "Password",
                                      text: $viewModel.password,
                                      isPasswordType: true)
                        CustomTextField(placeHolderText: "Confirm Password",
                        text: $viewModel.confirmPassword,
                        isPasswordType: true)
                    }.padding(.horizontal, 25)
                    
                    VStack(alignment: .center, spacing: 40) {
                        CustomButton(title: "Create Account",
                                     backgroundColor: UIColor(hexString: "#334D92"),
                                     action: { self.viewModel.signUp(with: self.state) })
                    }
                }
                .alert(isPresented: $viewModel.isAlertShown) {
                    Alert(title: Text("Oops, something went wrong!"),
                          message: Text(viewModel.error),
                          dismissButton: .default(Text("OK")))
                }
            }
            .padding(.horizontal,40)
            Spacer()
        }.sheet(isPresented: $isImagePickerShown,
                   onDismiss: viewModel.loadImage) {
                    ImagePicker(image: self.$viewModel.selectedImage,
                                source: self.imagePickerType)
        }
        .actionSheet(isPresented: $isActionSheetShown) {
            ActionSheet(title: Text("Choose images that represent for your style"), buttons: [
                .default(Text("Choose Photo")) {
                    self.imagePickerType = .photoLibrary
                    self.isImagePickerShown = true
                },
                .default(Text("Take Photo")) {
                    self.imagePickerType = .camera
                    self.isImagePickerShown = true
                },
                .cancel()
            ])
        }
    }
}
