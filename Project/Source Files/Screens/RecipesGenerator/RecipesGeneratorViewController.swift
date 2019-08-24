//
//  RecipesGeneratorViewController.swift
//  NetguruCollegeApp
//
import UIKit

final class RecipesGeneratorViewController: UIViewController {
    private var customView: RecipesGeneratorView {
        return view as! RecipesGeneratorView
    }
    // MARK: - Functions
    init() {
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
    }
}

extension RecipesGeneratorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.className) as! IngredientCell
        
        return cell
    }
}
