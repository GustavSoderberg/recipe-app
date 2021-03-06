//
//  RecipeDetailView.swift
//  CWCRecipeListApp
//
//  Created by Gustav Söderberg on 2022-03-25.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach (recipe.ingredients, id: \.self) { item in
                        Text("• \(item)")
                    }
                }
                .padding(.horizontal, 10)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text("\(index+1). \(recipe.directions[index])")
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal, 10)
                
            }
            
            
        }
        .navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
