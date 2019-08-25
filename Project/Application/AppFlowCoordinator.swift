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
        // TODO: insert viewmodel from appdependencies
        let viewController = RecipesGeneratorViewController(with: RecepiesGeneratorViewModel(), delegate: self)
        rootViewController = UINavigationController(rootViewController: viewController as UIViewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

extension AppFlowCoordinator: HelloWorldViewControllerDelegate {

    func didSelectNextButton() {

    }
}

extension AppFlowCoordinator: RecipesGeneratorViewControllerDelegate {
    func didFinishTypingIngridients(_ items: [String]) {
        let recipeRequester = RecipeRequester(with: appDependencies.reciepesAPIClient)
        let recipeTableViewModel = RecipiesTableViewModel(with: recipeRequester, ingredients: items)
        let nextViewController = RecipiesTableViewController(viewModel: recipeTableViewModel)
        rootViewController.show(nextViewController, sender: nil)
    }
}
