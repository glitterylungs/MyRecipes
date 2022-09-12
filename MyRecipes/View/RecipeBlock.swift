//
//  RecipeBlock.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 06/09/2022.
//

import SwiftUI

struct RecipeBlock: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 170, height: 170)
                .foregroundColor(.white)
            Image("beza")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 170)
                .clipped()
                .overlay(ImageOverlay(), alignment: .bottom)
    }
        .cornerRadius(25)
    }
}

struct RecipeBlock_Previews: PreviewProvider {
    static var previews: some View {
        RecipeBlock()
    }
}


