//
//  AddView.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 07/09/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    @StateObject private var viewModel = AddViewModel()
    
    @Binding var showAddView: Bool
    
    var body: some View {
        NavigationView {
                ScrollView {
                    HStack {
                        ZStack {
                            Image(uiImage: viewModel.image ?? UIImage())
                                .resizable()
                                .cornerRadius(8)
                                .padding()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 170)
                                .clipped()
                            //TEST
                            if viewModel.addImageButtonVisible {
                                Button(action: {
                                    viewModel.isShowPhotoLibrary = true
                                }) {
                                    Text("Add image")
                                        .frame(width: 170, height: 170)
                                        .font(.headline)
                                        .offset(y: 47)
                                        .foregroundColor(Color("textColor"))
                                }
                            }
                        }.sheet(isPresented: $viewModel.isShowPhotoLibrary) {
                            ImagePicker(selectedImage: $viewModel.image, photoButtonVisible: $viewModel.addImageButtonVisible, sourceType: .photoLibrary)
                        }
                        VStack {
                            TextField("Title", text: $viewModel.name)
                                .textFieldStyle(CustomTextFieldView())
                            Spacer()
                            TextField("Minutes", value: $viewModel.time, formatter: viewModel.numberFormatter)
                                .textFieldStyle(CustomTextFieldView())
                                .keyboardType(.decimalPad)
                            Spacer()
                            TextField("Servings", value: $viewModel.servings, formatter: viewModel.numberFormatter)
                                .textFieldStyle(CustomTextFieldView())
                                .keyboardType(.decimalPad)
                            Spacer()
                        }.padding(.trailing)
                            .padding(.top, 30)
                        
                    }
                    
                    VStack {
                        TextField("Ingredient", text: $viewModel.ingredientTextField)
                            .textFieldStyle(CustomTextFieldView()).padding()
                        Button {
                            viewModel.tryToAddIngredient()
                        } label: {
                            Label("Add ingredient", systemImage: "plus")
                        }.customButton()
                        List {
                            ForEach(viewModel.ingredients) { ingredient in
                                Label {
                                    Text(ingredient.content)
                                } icon: {
                                    Image(systemName: "cart")
                                        .foregroundColor(Color("green"))
                                }
                            }
                        }.frame(minHeight: minRowHeight * CGFloat(viewModel.ingredients.count))
                            .listStyle(.inset)
                    }.padding(.top, 30)
                    
                    VStack {
                        TextField("Direction", text: $viewModel.directionTextField)
                            .textFieldStyle(CustomTextFieldView()).padding()
                        Button {
                            viewModel.tryToAddDirection()
                        } label: {
                            Label("Add direction", systemImage: "plus")
                        }.customButton()
                        List {
                            ForEach(viewModel.directions) { direction in
                                Label {
                                    Text(direction.content)
                                } icon: {
                                    Image(systemName: "fork.knife")
                                        .foregroundColor(Color("green"))
                                }
                            }
                        }.frame(minHeight: minRowHeight * CGFloat(viewModel.directions.count))
                            .listStyle(.inset)
                    }.padding(.top, 30)
                    Button {
                      //  <#code#>
                    } label: {
                        Label("Save", systemImage: "plus.square")
                    }.customButton()
                    .padding(.top, 50)
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
            
            .navigationViewStyle(.stack)
            .interactiveDismissDisabled()
        }
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(showAddView: .constant(true))
            .previewInterfaceOrientation(.portrait)
            
    }
}
