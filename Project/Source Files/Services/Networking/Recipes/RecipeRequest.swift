//
//  RecipeRequest.swift
//  NetguruCollegeApp
//

import Foundation

final class RecipeRequest: APIRequest {
    
    var path: String = ""
    
    var method: APIMethod {
        return .get
    }
    
    var parameters: [String : String]?
 
    init(with ingredients: [String]) {
        self.parameters = ["i" : Helper().convertToOneString(array: ingredients, with: ",")]
    }
}
