//
//  Recipt.swift
//  NetguruCollegeApp
//

import Foundation

struct Recipe {
    let title: String
    let imageURL: String
    let ingredients: [String]
    let recipeURL: String
   
}

extension Recipe: Codable {
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case imageURL = "thumbnail"
        case ingredients = "ingredients"
        case recipeURL = "href"
    }
}

struct Recipes {
    let title: String
    let version: String
    let recipesURL: String
    let recipes: [Recipe]
}

extension Recipes: Codable {
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case version = "version"
        case recipesURL = "href"
        case recipes = "results"
    }
}
