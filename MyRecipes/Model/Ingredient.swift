//
//  Ingredient.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 20/09/2022.
//

import Foundation
import RealmSwift

class Ingredient: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
}
