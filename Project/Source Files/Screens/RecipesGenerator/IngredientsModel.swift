//
//  IngredientsModel.swift
//  NetguruCollegeApp
//


import Foundation

extension Notification.Name {
    static let RecepieBasedOnIngredientsQueryChangedNotification =
        Notification.Name("RecepieBasedOnIngredientsQueryModel")
}
class RecepieBasedOnIngredientsQueryModel {
    var ingredients = [String]() {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.RecepieBasedOnIngredientsQueryChangedNotification,
                                            object: nil,
                                            userInfo: ["recepieBasedOnIngredientsQueryModel": self])
        }
    }
}
