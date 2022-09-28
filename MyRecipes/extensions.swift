//
//  extensions.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 28/09/2022.
//

import Foundation
import SwiftUI


extension Button {
    @ViewBuilder
    func customButton() -> some View {
        self
            .buttonStyle(.borderedProminent)
            .tint(Color("green"))
    }
}
