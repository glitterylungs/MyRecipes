//
//  AddView.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 07/09/2022.
//

import SwiftUI

struct AddView: View {
    
    @Binding var showAddView: Bool
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170)
                        .clipped()
                    //TEST
                    Button(action: {
                        self.isShowPhotoLibrary = true
                    }) {
                        HStack {
                            Image(systemName: "photo")
                                .font(.system(size: 20))
                    
                            Text("Photo library")
                                .font(.headline)
                        }}
                }.sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(selectedImage: $image, sourceType: .photoLibrary)
                }
                //KONIEC TESTU
            }
            .navigationTitle("Create Recipe")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showAddView = false
                    } label: {
                        Image(systemName: "xmark").foregroundColor(.black)
                    }

                }
            }
        }.navigationViewStyle(.stack)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(showAddView: .constant(true))
    }
}
