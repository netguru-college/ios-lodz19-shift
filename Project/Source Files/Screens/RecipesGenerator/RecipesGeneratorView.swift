//
//  RecipesGeneratorView.swift
//  NetguruCollegeApp
//
import UIKit

final class RecipesGeneratorView: UIView {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var bottomBarConstraint: NSLayoutConstraint!
    @IBOutlet var addBar: UITextView!
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "RecipesGeneratorView", bundle: nil)
            .instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}
