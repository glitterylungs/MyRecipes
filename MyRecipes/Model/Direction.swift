//
//  Direction.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 20/09/2022.
//

import Foundation
import RealmSwift

class Direction: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var step: String
}
