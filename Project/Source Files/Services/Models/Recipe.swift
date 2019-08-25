//
//  Recipt.swift
//  NetguruCollegeApp
//

import Foundation

/// Model for retrived data from API.
struct Recipe {
    let title: String
    let imageURL: String
    let ingredients: String
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
