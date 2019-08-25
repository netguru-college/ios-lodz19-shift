//
//  RecipiesTableViewCell.swift
//  NetguruCollegeApp
//
import UIKit

class RecipiesTableViewCell: UITableViewCell {

    @IBOutlet var recipeImage: UIImageView!
    @IBOutlet var recipeTitle: UILabel!
    @IBOutlet var recipeIngredients: UILabel!

    class var identifier: String {
        return "RecipiesTableViewCell"
    }

    func setup(with image: UIImage, title: String, ingredients: String) {
        recipeImage.image = image
        recipeTitle.text = title
        let ingredients = createAttributedIngredientsLabel(ingredients: ingredients)
        recipeIngredients.attributedText = ingredients
    }

    private func createAttributedIngredientsLabel(ingredients: String) -> NSMutableAttributedString {
        let boldText = "Ingredients: "
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
        let attributedString = NSMutableAttributedString(string: boldText, attributes: attributes)

        let normalText = ingredients
        let normalString = NSMutableAttributedString(string: normalText)
        attributedString.append(normalString)
        return attributedString
    }
}
