//
//  RecipesGeneratorViewController.swift
//  NetguruCollegeApp
//
import UIKit

final class RecipesGeneratorViewController: UIViewController {
    private let recepiesGeneratorViewModel: RecepiesGeneratorViewModel
    private var customView: RecipesGeneratorView {
        return view as! RecipesGeneratorView
    }
    private var observations = [NSKeyValueObservation]()

    // MARK: - Functions
    init(with vm: RecepiesGeneratorViewModel) {
        self.recepiesGeneratorViewModel = vm
        super.init(nibName: nil, bundle: nil)
        self.title = "Ingredients"
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = RecipesGeneratorView.instanceFromNib()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.tableView.dataSource = self
        let nib = UINib(nibName: IngredientCell.className, bundle: nil)
        customView.tableView!.register(nib, forCellReuseIdentifier: IngredientCell.className)
        recepiesGeneratorViewModel.delegate = self
        customView.addBar.delegate = self
    }
}

extension RecipesGeneratorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recepiesGeneratorViewModel.ingredients.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.className) as! IngredientCell
        cell.ingredientLabel.text = recepiesGeneratorViewModel.ingredients[indexPath.item]
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        recepiesGeneratorViewModel.shouldRemoveIngredient(at: indexPath)
    }
}

// MARK: - Mocked textView
extension RecipesGeneratorViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            guard let newIngredient = textView.text  else { return false }
            recepiesGeneratorViewModel.shouldAdd(newIngredient: newIngredient)
        }
        return true
    }
}

extension RecipesGeneratorViewController: RecepiesGeneratorViewModelDelegate {
    func willChangeData() {
        customView.tableView.beginUpdates()
    }

    func insertData(at indexPath: IndexPath) {
        customView.tableView.insertRows(at: [indexPath], with: .bottom)
    }

    func didChangeData() {
        customView.tableView.endUpdates()
    }

}
