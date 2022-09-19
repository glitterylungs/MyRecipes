//
//  Recipe.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 26/08/2022.
//

import Foundation
import RealmSwift

class Recipe: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var image: String
    @Persisted var time: Int
    @Persisted var servings: Int
    @Persisted var ingredients: List<Ingredient>
    @Persisted var directions: List<Direction>
}
