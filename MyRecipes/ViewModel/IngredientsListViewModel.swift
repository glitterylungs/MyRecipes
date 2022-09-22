//
//  IngredientListViewModel.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 20/09/2022.
//

import Foundation
import SwiftUI

extension IngredientsListView {
    @MainActor class IngredientListViewModel: ObservableObject {
        @EnvironmentObject var ingredients: IngredientsList
        @Published var text = ""
        
        func tryToAddIngredient() {
            guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
                return
            }
            
            let newIngredient = PreIngredient(name: text)
            ingredients.ingredientss.append(newIngredient)
            text = ""
            print("add")
            print(ingredients)
        }
    }
}



