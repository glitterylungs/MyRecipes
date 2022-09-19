//
//  DynamicListView.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 17/09/2022.
//

import SwiftUI

struct IngredientsListView: View {
    @StateObject private var viewModel = IngredientListViewModel()
    var body: some View {
        VStack {
            List {
                ForEach( viewModel.ingredients) { ingredient in
                    IngredientRow(title: ingredient.name)
                }
            }
        }
    }
}

struct IngredientRow: View {
    let title: String
    var body: some View {
        Label {
        Text(title)
        } icon: {
            Image(systemName: "fork.knife")
        }

    }
}

struct DynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsListView()
    }
}
