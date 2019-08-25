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
    func fetchRecipes(for ingredients: [String], handler: @escaping (Recipes) -> Void) {
        let request = RecipeRequest(with: ingredients)
        apiClient.sendRequestAndDecode(
            request: request,
            success:  { (data: Recipes) in
                handler(data)
            }) { (error) in
                print("Something went wrong: \(error?.localizedDescription)")
        }
    }
}
