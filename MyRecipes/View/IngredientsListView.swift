//
//  DynamicListView.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 17/09/2022.
//

import SwiftUI

struct IngredientsListView: View {
    @StateObject private var viewModel = IngredientListViewModel()
    @State private var text = ""
    
    var body: some View {
        VStack {
            TextField("Ingredient", text: $text).textFieldStyle(CustomTextFieldView()).padding()
            Button {
                tryToAddIngredient()
            } label: {
                Text("Add")
            }
            List {
                ForEach(viewModel.ingredients) { ingredient in
                    IngredientRow(title: ingredient.name)
                }
            }
        }
    }
    
    func tryToAddIngredient() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        let newIngredient = PreIngredient(name: text)
        viewModel.ingredients.append(newIngredient)
        text = ""
    }
}

struct IngredientRow: View {
    let title: String
    var body: some View {
        Label {
        Text(title)
        } icon: {
            Image(systemName: "fork.knife")
        }

    }
}

struct DynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsListView()
    }
}
