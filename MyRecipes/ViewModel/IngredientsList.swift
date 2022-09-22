//
//  IngredientsList.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 22/09/2022.
//

import Foundation

final class IngredientsList: ObservableObject {
    @Published var ingredientss = [PreIngredient]()
}
