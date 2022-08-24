//
//  ContentView.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 24/08/2022.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    //Data testowa
    private var data: [Int] = Array(1...20)
    private let colors: [Color] = [.red, .blue, .yellow, .green]
    
    //Jeśli nie będzie miejsca to będzie tylko jedna kolumna
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    //TO DO
    @State private var query: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundColor(colors[number%4])
                                .cornerRadius(25)
                            Text("\(number)")
                    }
                        
                    }
                }
            }
            .padding()
            .navigationTitle("MyRecipes")
            // Add search bar
            // TO DO
            .searchable(text: $query, prompt: "Find a recipe")
            // Passing text from search bar to the function
            // TO DO --> I have to create new searching function in new observable object (??)
            .onChange(of: query) { newValue in
                //              <#code#>
            }
            
            //  NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
        }.navigationViewStyle(.stack)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
