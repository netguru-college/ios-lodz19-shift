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

    /// Sets up a cell.
    ///
    /// - Parameters:
    ///   - image: an image of the recipe from URL source
    ///   - title: title of a recipe
    ///   - ingredients: ingredients used in a recipe
    func setup(with image: UIImage, title: String, ingredients: String) {
        recipeImage.image = image
        recipeTitle.text = title
        let ingredients = createAttributedIngredientsLabel(ingredients: ingredients)
        recipeIngredients.attributedText = ingredients
    }

    /// Create label to the recipeIngredients that has bold "Ingredients: " element
    ///
    /// - Parameters:
    ///   - ingredients: ingredients used in a recipe
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
