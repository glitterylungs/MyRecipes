//
//  MenuViewModel.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 08/09/2022.
//

import Foundation

extension MenuView {
    @MainActor class MenuViewModel: ObservableObject {
        
        @Published var showAddView = false
    }
}
