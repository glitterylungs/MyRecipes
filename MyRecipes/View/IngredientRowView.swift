//
//  IngredientRowView.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 22/09/2022.
//

import SwiftUI

struct IngredientRowView: View {
    let title: String
    var body: some View {
        Label {
        Text(title)
        } icon: {
            Image(systemName: "fork.knife")
        }

    }
}

struct IngredientRowView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientRowView(title: "")
    }
}
