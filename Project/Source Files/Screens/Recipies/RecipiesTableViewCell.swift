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
    func setup(with url: URL?, title: String, ingredients: String) {
        if let url = url {
            recipeImage.downloadImage(from: url)
        } else {
            self.recipeImage.image = UIImage(named: "RecipeIcon")
        }
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

extension UIImageView {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL) {
        getData(from: url) {
            data, response, error in
            guard let data = data, error == nil else {
                self.image = UIImage(named: "RecipeIcon")
                print(error?.localizedDescription)
                return
            }
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }
    }
}
