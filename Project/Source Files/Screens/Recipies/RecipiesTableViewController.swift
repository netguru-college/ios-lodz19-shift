//
//  RecipiesViewController.swift
//  NetguruCollegeApp
//

import UIKit

class RecipiesTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var dataBase = [
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
                           forCellReuseIdentifier: "RecipiesTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}

extension RecipiesTableViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBase.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipiesTableViewCell",
                                                 for: indexPath) as! RecipiesTableViewCell
        cell.recipeImage.image = dataBase[indexPath.row].image
        cell.recipeTitle.text = dataBase[indexPath.row].title
        let ingredients = createAttributedIngredientsLabel(ingredients: dataBase[indexPath.row].ingredients)
        cell.recipeIngredients.attributedText = ingredients
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}

func createAttributedIngredientsLabel(ingredients: String) -> NSMutableAttributedString {
    let boldText = "Ingredients: "
    let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
    let attributedString = NSMutableAttributedString(string: boldText, attributes: attributes)

    let normalText = ingredients
    let normalString = NSMutableAttributedString(string: normalText)
    attributedString.append(normalString)
    return attributedString
}

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
