//
//  RecepiesGeneratorViewModel.swift
//  NetguruCollegeApp
//

import Foundation

protocol RecepiesGeneratorViewModelDelegate: class {
    func willChangeData()
    func insertData(at indexPath: IndexPath)
    func deleteData(at indexPath: IndexPath)
    func didChangeData()
}
class RecepiesGeneratorViewModel {
    private(set) var ingredients = [String]()
    weak var delegate: RecepiesGeneratorViewModelDelegate?

    func shouldAdd(newIngredient ingredient: String) {
        assert(!ingredient.isEmpty, "Trying to add empty ingredient")
        delegate?.willChangeData()
        delegate?.insertData(at: IndexPath(row: ingredients.count, section: 0))
        ingredients.append(ingredient)
        delegate?.didChangeData()
    }
    func shouldRemoveIngredient(at indexPath: IndexPath) {
        assert(indexPath.section == 0, "There aren't any other section than first one")
        delegate?.willChangeData()
        ingredients.remove(at: indexPath.row)
        delegate?.deleteData(at: indexPath)
        delegate?.didChangeData()
    }

}
