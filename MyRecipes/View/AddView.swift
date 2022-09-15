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
    @State private var addImageButtonVisible = true
    @State private var image = UIImage(named: "addImage")
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    ZStack {
                        Image(uiImage: image ?? UIImage())
                            .resizable()
                            .cornerRadius(8)
                            .padding()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 170)
                            .clipped()
                        //TEST
                        if addImageButtonVisible {
                            Button(action: {
                                self.isShowPhotoLibrary = true
                            }) {
                                Text("Add image")
                                    .frame(width: 170, height: 170)
                                    .font(.headline)
                                    .offset(y: 47)
                                    .foregroundColor(Color("textColor"))
                                }
                        }
                    }.sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(selectedImage: $image, photoButtonVisible: $addImageButtonVisible, sourceType: .photoLibrary)
                    }
                    VStack {
                        TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        Spacer()
                        TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        Spacer()
                        TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }.padding(.trailing)
                        .padding(.top, 30)

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
