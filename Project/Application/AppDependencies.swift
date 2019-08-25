//
//  AppDependencies.swift
//  NetguruCollegeApp
//

import Foundation

/// The class that keeps dependencies for the app.
final class AppDependencies {

    let appClientForRecipes = APIClient(withURL: "http://www.recipepuppy.com/api/")
}
