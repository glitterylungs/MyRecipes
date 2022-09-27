//
//  AddViewModel.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 22/09/2022.
//

import Foundation

extension AddView {
    @MainActor class AddViewModel: ObservableObject {
        @Published var ingredients: [PreIngredient] = [PreIngredient(name: "fasgv"), PreIngredient(name: "sbsbgfs")]
        @Published var ingredientTextField: String = ""
        
        func tryToAddIngredient() {
            guard !ingredientTextField.trimmingCharacters(in: .whitespaces).isEmpty else {
                return
            }
            let newIngredient = PreIngredient(name: ingredientTextField)
            ingredients.append(newIngredient)
            ingredientTextField = ""
            print("add")
            print(ingredients)
        }
    }
}
