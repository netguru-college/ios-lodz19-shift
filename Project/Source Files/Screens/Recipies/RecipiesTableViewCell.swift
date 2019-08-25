//
//  RecipiesTableViewCell.swift
//  NetguruCollegeApp
//
import UIKit

class RecipiesTableViewCell: UITableViewCell {

    @IBOutlet var recipeImage: UIImageView!
    @IBOutlet var recipeTitle: UILabel!
    @IBOutlet var recipeIngredients: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
