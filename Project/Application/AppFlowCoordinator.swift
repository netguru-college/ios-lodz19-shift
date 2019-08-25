//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    private let window: UIWindow

    /// Passing AppDependencies to the AppFlowCoordinator
    private let appDependencies: AppDependencies
    init(window: UIWindow, appDependencies: AppDependencies) {
        self.window = window
        self.appDependencies = appDependencies
    }

    func initializeApp() {
        let viewController = HelloWorldViewController(delegate: self)
        rootViewController = UINavigationController(rootViewController: viewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

extension AppFlowCoordinator: HelloWorldViewControllerDelegate {

    func didSelectNextButton() {
        let recipeRequester = RecipeRequester(with: appDependencies.reciepesAPIClient)
        let recipeTableViewModel = RecipiesTableViewModel(with: recipeRequester, ingredients: ["onions", "garlic"])
        let nextViewController = RecipiesTableViewController(viewModel: recipeTableViewModel)
        rootViewController.show(nextViewController, sender: nil)
    }
}
