//
//  Category.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 26/08/2022.
//

import Foundation
import RealmSwift

class Category: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var image: String
    @Persisted var recipes: List<Recipe>
}
