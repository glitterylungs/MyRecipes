//
//  DynamicListView.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 17/09/2022.
//

import SwiftUI

struct IngredientsListView: View {
    @StateObject private var viewModel = IngredientListViewModel()
    
    var body: some View {
        VStack {
            TextField("Ingredient", text: $viewModel.text).textFieldStyle(CustomTextFieldView()).padding()
            Button {
                viewModel.tryToAddIngredient()
            } label: {
                Text("Add")
            }
        
            List {
                ForEach(viewModel.ingredients.ingredientss) { ingredient in
                    IngredientRowView(title: ingredient.name)
                    let _ = print("show")
                }
            }
        }
    }
}



struct DynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsListView().environmentObject(IngredientsList())
    }
}
