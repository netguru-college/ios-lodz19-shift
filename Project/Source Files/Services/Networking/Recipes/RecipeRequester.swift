//
//  RecipeRequester.swift
//  NetguruCollegeApp
//

import Foundation

/// Requester for Recipe Puppy API. Contains method to fetch recipes from API.
struct RecipeRequester {

    private let apiClient: APIClient

    init(with apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func fetchRecipes(for ingredients: [String], handler: @escaping (Result<Recipes, Error>) -> Void) {
        let request = RecipeRequest(with: ingredients)
        apiClient.sendRequestAndDecode(
            request: request,
            success: { data in
                handler(.success(data))
            }, failure: { error in
            guard let error = error else {
                assert(false, "There is not known error.")
                return
            }
            handler(.failure(error))
            })
    }
}
