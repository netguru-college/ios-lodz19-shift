//
//  RecipiesViewController.swift
//  NetguruCollegeApp
//

import UIKit

class RecipiesTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    // TODO: Remove when the API implementation will be ready.
    var recepies = [
        Recipe(image: UIImage(named: "TestingImage")!,
               title: "Let's cook something",
               ingredients: "Garlic, beef, salt, Garlic, beef, salt, Garlic, beef, salt"),
        Recipe(image: UIImage(named: "TestingImage2")!,
               title: "Another cool recipe",
               ingredients: "Mango, Melon, Water")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        tableView.register(UINib(nibName: "RecipiesTableViewCell", bundle: nil),
                           forCellReuseIdentifier: RecipiesTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension RecipiesTableViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recepies.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: RecipiesTableViewCell.identifier,
                                                 for: indexPath) as! RecipiesTableViewCell

        cell.setup(with: recepies[indexPath.row].image,
                   title: recepies[indexPath.row].title,
                   ingredients: recepies[indexPath.row].ingredients)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    // TODO: Add func tableView - didSelectRow
}

// TODO: Remove when the API implementation will be ready.
public class Recipe {
    public var image: UIImage
    public var title: String
    public var ingredients: String
    init(image: UIImage, title: String, ingredients: String) {
        self.image = image
        self.title = title
        self.ingredients = ingredients
    }
}
