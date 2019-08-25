//
//  Recipes.swift
//  NetguruCollegeApp
//


import Foundation

struct Recipes {
    let title: String
    let version: Float
    let recipesURL: String
    let recipes: [Recipe]
}

extension Recipes: Codable {
    
    enum CodingKeys: String, CodingKey {
        case title
        case version
        case recipesURL = "href"
        case recipes = "results"
    }
}
