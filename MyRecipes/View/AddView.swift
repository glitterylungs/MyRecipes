//
//  AddView.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 07/09/2022.
//

import SwiftUI

struct PreIngredient: Identifiable {
    var id = UUID()
    var content: String
}

struct PreDirection: Identifiable {
    var id = UUID()
    var content: String
}


struct AddView: View {
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @StateObject private var viewModel = AddViewModel()
    
    @Binding var showAddView: Bool
    @State private var isShowPhotoLibrary: Bool = false
    @State private var addImageButtonVisible: Bool = true
    @State private var image: UIImage? = UIImage(named: "addImage")
    @State private var name: String = ""
    @State private var time: Int = 0
    @State private var servings: Int = 0
    
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol = ""
        return formatter
    }()
    
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
                            TextField("Title", text: $name)
                                .textFieldStyle(CustomTextFieldView())
                            Spacer()
                            TextField("Minutes", value: $time, formatter: numberFormatter)
                                .textFieldStyle(CustomTextFieldView())
                                .keyboardType(.decimalPad)
                            Spacer()
                            TextField("Servings", value: $servings, formatter: numberFormatter)
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
                            Text("Add")
                        }
                        List {
                            ForEach(viewModel.ingredients) { ingredient in
                                ListRow(text: ingredient.content, image: "cart")
                            }
                        }.frame(minHeight: minRowHeight * CGFloat(viewModel.ingredients.count))
                            .listStyle(.plain)
                        
                    }
                    VStack {
                        TextField("Direction", text: $viewModel.directionTextField)
                            .textFieldStyle(CustomTextFieldView()).padding()
                        Button {
                            viewModel.tryToAddDirection()
                        } label: {
                            Text("Add")
                        }
                        List {
                            ForEach(viewModel.directions) { direction in
                                ListRow(text: direction.content, image: "fork.knife")
                            }
                        }.frame(minHeight: minRowHeight * CGFloat(viewModel.ingredients.count))
                            .listStyle(.plain)
                        
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
            
            .navigationViewStyle(.stack)
            .interactiveDismissDisabled()
        }
    }
}

struct ListRow: View {
    let text: String
    let image: String
    
    var body: some View {
        
        Label {
            Text(text)
        } icon: {
            Image(systemName: image)
        }


    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(showAddView: .constant(true))
            .previewInterfaceOrientation(.portrait)
            
    }
}
