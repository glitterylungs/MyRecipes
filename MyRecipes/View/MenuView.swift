//
//  ContentView.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 24/08/2022.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject private var viewModel = MenuViewModel()
    
    //Jeśli nie będzie miejsca to będzie tylko jedna kolumna
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    //TEST
    private var data: [Int] = Array(1...20)
    
    //TO DO
    @State private var query: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(data, id: \.self) { number in
                        RecipeBlock()
                    }
                }
            }
            .padding()
            .navigationTitle("MyRecipes")
            .toolbar(content: {
                Button {
                    viewModel.showAddView.toggle()
                } label: {
                    Image(systemName: "plus").foregroundColor(.black)
                }

            })
            // Add search bar, placement --> jest zawsze widoczny(nie tylko po scrollingu)
            // TO DO
            .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always), prompt: "Find a recipe")
            // Passing text from search bar to the function
            // TO DO --> I have to create new searching function in new observable object (??)
            .onChange(of: query) { newValue in
                //              <#code#>
            }
            
            //  NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
        }.navigationViewStyle(.stack)
            .sheet(isPresented: $viewModel.showAddView) {
                AddView(showAddView: $viewModel.showAddView)
            }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
