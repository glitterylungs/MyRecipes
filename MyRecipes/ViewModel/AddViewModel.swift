//
//  AddViewModel.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 22/09/2022.
//

import Foundation

extension AddView {
    @MainActor class AddViewModel: ObservableObject {
        @Published var ingredients = [PreIngredient]()
        @Published var directions = [PreDirection]()
        @Published var ingredientTextField: String = ""
        @Published var directionTextField: String = ""
        
        func tryToAddIngredient() {
            guard !ingredientTextField.trimmingCharacters(in: .whitespaces).isEmpty else {
                return
            }
            let newIngredient = PreIngredient(content: ingredientTextField)
            ingredients.append(newIngredient)
            ingredientTextField = ""
        }
        
        func tryToAddDirection() {
            guard !directionTextField.trimmingCharacters(in: .whitespaces).isEmpty else {
                return
            }
            let newDirection = PreDirection(content: directionTextField)
            directions.append(newDirection)
            directionTextField = ""
        }
    }
}
