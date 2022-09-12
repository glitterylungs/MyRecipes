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
    @State private var photoButtonVisible = true
    @State private var image = UIImage(named: "addImage")
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    ZStack {
                        Image(uiImage: image ?? UIImage())
                            .resizable()
                            .padding()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 170)
                            .clipped()
                        //TEST
                        if photoButtonVisible {
                            Button(action: {
                                self.isShowPhotoLibrary = true
                            }) {
                                Text("Add image")
                                    .font(.headline)
                                    .offset(y: 55)
                                    .padding(.vertical, 55)
                                    .foregroundColor(Color("textColor"))
                                }
                        }
                    }.sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(selectedImage: $image, photoButtonVisible: $photoButtonVisible, sourceType: .photoLibrary)
                    }
                    Spacer()
                    Text("testtest")
                        .padding()
                    //KONIEC TESTU
                }
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
            .previewInterfaceOrientation(.portrait)
    }
}
