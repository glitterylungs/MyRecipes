//
//  ImagePicker.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 08/09/2022.
//

import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    // selectedImage variable is used to store the selected image
    @Binding var selectedImage: UIImage?
    @Binding var photoButtonVisible: Bool
    
    // presentationMode variable is used to dismiss the photo library
    @Environment(\.presentationMode) var presentationMode
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
     
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = sourceType
        
        imagePicker.delegate = context.coordinator
     
        return imagePicker
    }
     
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
     
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}


final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    var parent: ImagePicker
 
    init(_ parent: ImagePicker) {
        self.parent = parent
    }
 
    // The method will be called when an image is selected
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
 
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            parent.selectedImage = image
            parent.photoButtonVisible = false
        }
 
        parent.presentationMode.wrappedValue.dismiss()
    }
}
