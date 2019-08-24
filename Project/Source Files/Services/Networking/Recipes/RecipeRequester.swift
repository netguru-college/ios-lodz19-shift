//
//  RecipeRequester.swift
//  NetguruCollegeApp
//


import Foundation

/// Requester for Recipe Puppy API
struct RecipeRequester {
    
    private let apiClient: APIClient
    
    init(with apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchRecipes(for ingredients: [String]) -> [Recipe] {
        let request = RecipeRequest(with: ingredients)
        var recipes: [Recipe] = []
        apiClient.sendRequestAndDecode(
            request: request,
            success: { (data: Recipes) in
                recipes = data.recipes
        }) { (error) in
        }
        return recipes
    }
}
