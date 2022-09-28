//
//  AddViewModel.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 22/09/2022.
//

import Foundation
import SwiftUI

extension AddView {
    @MainActor class AddViewModel: ObservableObject {
        
        @Published var isShowPhotoLibrary: Bool = false
        @Published var addImageButtonVisible: Bool = true
        @Published var image: UIImage? = UIImage(named: "addImage")
        @Published var name: String = ""
        @Published var time: Int = 0
        @Published var servings: Int = 0
        
        @Published var ingredients = [PreIngredient]()
        @Published var directions = [PreDirection]()
        @Published var ingredientTextField: String = ""
        @Published var directionTextField: String = ""
        
        let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.zeroSymbol = ""
            return formatter
        }()
        
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
