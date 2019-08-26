//
//  RecipesGeneratorViewController.swift
//  NetguruCollegeApp
//
import UIKit

protocol RecipesGeneratorViewControllerDelegate: AnyObject {
    func didFinishTypingIngridients(_ items: [String])
}

final class RecipesGeneratorViewController: UIViewController {

    private let viewModel: RecepiesGeneratorViewModel
    private var customView: RecipesGeneratorView { return view as! RecipesGeneratorView }
    weak var delegate: RecipesGeneratorViewControllerDelegate?

    init(viewModel: RecepiesGeneratorViewModel, delegate: RecipesGeneratorViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = RecipesGeneratorView.instanceFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Ingredients"

        let nib = UINib(nibName: IngredientCell.className, bundle: nil)
        customView.tableView!.register(nib, forCellReuseIdentifier: IngredientCell.className)

        customView.tableView.dataSource = self
        viewModel.delegate = self
        customView.ingredientTextField.delegate = self

        // setup navigation bar
        navigationController?.navigationBar.barTintColor = UIColor.defaultGreen
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(self.didTapDoneBarButtonItem))

        // Observe for keyboard notifiactions
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    @objc func keyboardWillShow(notification: Notification) {
        keyboard(willBeVisible: true, notification: notification)
    }

    @objc func keyboardWillHide(notification: Notification) {
        keyboard(willBeVisible: false, notification: notification)
    }

    private func keyboard(willBeVisible isShowing: Bool, notification: Notification) {

        if let userInfo = notification.userInfo,
        let keyboardRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue,
        let rawAnimationCurveValue = (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as AnyObject).uint32Value,
        let animationCurve = UIView.AnimationCurve(rawValue: Int(rawAnimationCurveValue) << 16),
        let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue {
            let convertedKeyboardRect = customView.convert(keyboardRect, from: nil)
            let heightOffset = self.view.bounds.size.height - convertedKeyboardRect.origin.y

            // Create new OptionSet by combing two options
            let animationOptions = UIView.AnimationOptions(rawValue: UInt(animationCurve.rawValue)
                                   | UIView.AnimationOptions.beginFromCurrentState.rawValue)

            switch isShowing {
            case true:
                // since a heightOffset already includes height of safeAreaInset.bottom we have to
                // subtract safeAreaInset.bottom from heightOffset as it is already accouted for
                customView.bottomBarToSafeAreaBottomConstraint.constant = -heightOffset
                                                                          + customView.safeAreaInsets.bottom
            case false:
                customView.bottomBarToSafeAreaBottomConstraint.constant = -heightOffset
            }

            UIView.animate(withDuration: animationDuration,
                           delay: 0,
                           options: animationOptions,
                           animations: { self.customView.layoutIfNeeded() })

        }
    }

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
        return true
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        viewModel.shouldRemoveIngredient(at: indexPath)
    }

}

// Extension for handling ingredientsTextField
extension RecipesGeneratorViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let ingredient = textField.text, !ingredient.isEmpty {
            viewModel.shouldAdd(newIngredient: ingredient)
            textField.text = ""
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

    func deleteData(at indexPath: IndexPath) {
        customView.tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    func didChangeData() {
        customView.tableView.endUpdates()
    }

}
