//
//  DynamicListView.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 17/09/2022.
//

import SwiftUI

struct DynamicListView: View {
    var body: some View {
        VStack {
            List {
                IngredientRow(title: "lalal")
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
        DynamicListView()
    }
}
