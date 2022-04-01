//
//  RecipeModel.swift
//  CWCRecipeListApp
//
//  Created by Gustav Söderberg on 2022-03-25.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = DataService.getLocalData()
        
    }
}
