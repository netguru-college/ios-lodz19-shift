//
//  RecipiesTableViewModel.swift
//  NetguruCollegeApp
//

import Foundation

protocol RecipiesTableViewModelDelegate: NSObject {
    func didFetchRecipies(_ recipies: [Recipe])
}

final class RecipiesTableViewModel {

    weak var delegate: RecipiesTableViewModelDelegate?

    private let recipeRequester: RecipeRequester

    private let ingredients: [String]

    init(with recipeRequester: RecipeRequester, ingredients: [String]) {
        self.recipeRequester = recipeRequester
        self.ingredients = ingredients
    }

    func fetchRecipies() {
        recipeRequester.fetchRecipes(for: ingredients) { [weak self] (result) in
            switch result {
            case .success(let success):
                var items: [Recipe] = success.recipes
                if items.count > 5 {
                    items = Array(items.prefix(upTo: 4))
                }
                self?.delegate?.didFetchRecipies(items)
            case .failure(let error):
                print(error)
            }
        }
    }
}
