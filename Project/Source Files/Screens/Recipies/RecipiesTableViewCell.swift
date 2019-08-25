//
//  RecipiesTableViewCell.swift
//  NetguruCollegeApp
//
import UIKit

class RecipiesTableViewCell: UITableViewCell {

    @IBOutlet var recipeImage: UIImageView!
    @IBOutlet var recipeTitle: UILabel!
    @IBOutlet var recipeIngredients: UILabel!

    func setupCell(with image: UIImage, title: String, ingredients: String) {

        self.recipeImage.image = image
        self.recipeTitle.text = title
        let ingredients = createAttributedIngredientsLabel(ingredients: ingredients)
        self.recipeIngredients.attributedText = ingredients
    }
}
