//
//  DataService.swift
//  CWCRecipeListApp
//
//  Created by Gustav Söderberg on 2022-03-25.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        guard let pathString = Bundle.main.path(forResource: "recipes", ofType: "json") else {
            print ("E: DataService - getLocalData(): Failed to guard path")
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                }
                
                return recipeData
            }
            catch {
                print ("E: DataService - getLocalData(): Failed to decode data")
                print(error)
            }
            
        }
        catch {
            print ("E: DataService - getLocalData(): Failed to fetch Data")
            print(error)
        }
        
        return [Recipe]()
    }
    
}
