//
//  ContentView.swift
//  CWCRecipeListApp
//
//  Created by Gustav Söderberg on 2022-03-25.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var recipeM = RecipeModel()
    
    var body: some View {

        NavigationView {
            
            List(recipeM.recipes) { r in
                
                NavigationLink {
                    RecipeDetailView(recipe: r)
                } label: {
                    HStack(spacing: 20.0) {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(r.name)
                    }
                }
                
            }
            .navigationTitle("All Recipes")
            
        }

    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
