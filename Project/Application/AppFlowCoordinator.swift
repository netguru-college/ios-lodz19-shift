//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    private let window: UIWindow

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
        let recipeRequester = RecipeRequester(with: appDependencies.appClientForRecipes)
        let nextViewController = WelcomeViewController()
        rootViewController.show(nextViewController, sender: nil)
    }
}
