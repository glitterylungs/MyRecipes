//
//  ImageOverlay.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 06/09/2022.
//

import SwiftUI

struct ImageOverlay: View {
    
    var body: some View {
        ZStack {
            Text("Beza")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
        .background(Color.black)
        .opacity(0.8)
        .padding(0)
    }
}

struct ImageOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ImageOverlay()
    }
}


