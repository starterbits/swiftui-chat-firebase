//
//  ImagePicker.swift
//  iShop SwiftUI
//
//  Created by iOS App Templates on 02/08/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//


import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    
    class Coordinator : NSObject , UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent : ImagePicker
            
        init(_ parent : ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiimage = info[.editedImage] as? UIImage{
                parent.image = uiimage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image : UIImage?
    @State var source : UIImagePickerController.SourceType
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = source
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
}
