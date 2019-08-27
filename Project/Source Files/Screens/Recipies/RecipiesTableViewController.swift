//
//  RecipiesViewController.swift
//  NetguruCollegeApp
//

import UIKit

class RecipiesTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    let viewModel: RecipiesTableViewModel

    var recepies: [Recipe] = []

    init(viewModel: RecipiesTableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.fetchRecipies()
    }
    private func setupView() {
        tableView.register(UINib(nibName: RecipiesTableViewCell.identifier, bundle: nil),
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

        cell.setup(with: URL(string: recepies[indexPath.row].imageURL),
                   title: recepies[indexPath.row].title,
                   ingredients: recepies[indexPath.row].ingredients)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    // TODO: Add func tableView - didSelectRow
}

extension RecipiesTableViewController: RecipiesTableViewModelDelegate {
    func didFetchRecipies(_ recipies: [Recipe]) {
        self.recepies = recipies
        tableView.reloadData()
    }
}
