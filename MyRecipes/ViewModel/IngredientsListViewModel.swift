//
//  IngredientListViewModel.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 20/09/2022.
//

import Foundation

extension IngredientsListView {
    @MainActor class IngredientListViewModel: ObservableObject {
        @Published var ingredients = [PreIngredient]()
    
    }
    
}
