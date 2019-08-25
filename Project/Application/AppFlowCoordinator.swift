//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
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
        let nextViewController = WelcomeViewController()
        rootViewController.show(nextViewController, sender: nil)
    }
}

extension AppFlowCoordinator: RecipesGeneratorViewControllerDelegate {
    func didFinishTypingIngridients(_ items: [String]) {

    }
}
