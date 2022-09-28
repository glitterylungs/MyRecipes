//
//  PreData.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 28/09/2022.
//

import Foundation

struct PreIngredient: Identifiable {
    var id = UUID()
    var content: String
}

struct PreDirection: Identifiable {
    var id = UUID()
    var content: String
}
