//
//  RecipesGeneratorViewController.swift
//  NetguruCollegeApp
//
import UIKit

protocol RecipesGeneratorViewControllerDelegate: class {
    func didFinishTypingIngridients(_ items: [String])
}

final class RecipesGeneratorViewController: UIViewController {
    private let viewModel: RecepiesGeneratorViewModel
    private var customView: RecipesGeneratorView {
        return view as! RecipesGeneratorView
    }
    private var observations = [NSKeyValueObservation]()

    weak var delegate: RecipesGeneratorViewControllerDelegate?
    // MARK: - Functions
    init(with vm: RecepiesGeneratorViewModel, delegate: RecipesGeneratorViewControllerDelegate) {
        self.viewModel = vm
        self.delegate = delegate
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
        viewModel.delegate = self
        customView.addBar.delegate = self

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.didTapDoneBarButtonItem))

//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
//    @objc func keyboardWillShow(notification: NSNotification) {
//        guard let userInfo = notification.userInfo else { return }
//        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
//        let keyboardFrame = keyboardSize.cgRectValue
//        if self.customView.bottomBarConstraint.constant == 42 {
//            self.customView.bottomBarConstraint.constant += keyboardFrame.height
//        }
//    }
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0 {
//            self.customView.bottomBarConstraint.constant = 42
//        }
//    }

    @objc private func didTapDoneBarButtonItem() {
        delegate?.didFinishTypingIngridients(viewModel.ingredients)
    }
}

extension RecipesGeneratorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.ingredients.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.className) as! IngredientCell
        cell.ingredientLabel.text = viewModel.ingredients[indexPath.item]
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        viewModel.shouldRemoveIngredient(at: indexPath)
    }
}

// MARK: - Mocked textView
extension RecipesGeneratorViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            guard let newIngredient = textView.text  else { return false }
            textView.text = ""
            viewModel.shouldAdd(newIngredient: newIngredient)
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
