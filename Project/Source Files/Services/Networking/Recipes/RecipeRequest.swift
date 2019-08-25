//
//  RecipeRequest.swift
//  NetguruCollegeApp
//

import Foundation

/// RecipeRequets has prepared request with ingerdients converted into proper format.
final class RecipeRequest: APIRequest {

    var path: String = ""
    var method: APIMethod {
        return .get
    }

    var parameters: [String: String]?
    init(with ingredients: [String]) {
        self.parameters = ["i": ingredients.joined(separator: ",")]
    }
}
