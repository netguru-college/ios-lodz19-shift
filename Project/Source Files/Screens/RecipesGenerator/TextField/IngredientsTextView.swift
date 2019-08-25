//
//  IngredientsTextView.swift
//  NetguruCollegeApp
//

import UIKit

protocol IngredientsTextViewDelegate: AnyObject {
    /// Notifies when the user hit enter in text field.
    /// - Parameter text: The text which is added in the text field currently.
    func didAddIngridient(_ view: IngredientsTextView, text: String)
}

class IngredientsTextView: UIView {
    @IBOutlet var ingredientsTextField: UITextField!
    @IBOutlet var cameraButtonView: UIButton!
    @IBOutlet var contentView: UIView!
    weak var delegate: IngredientsTextViewDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        ingredientsTextField.delegate = self
    }
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "IngredientsTextView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    // TODO: camera button action 
    @IBAction func cameraButtonPressed(_ sender: Any) {
        
    }
}
extension IngredientsTextView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return true
        }
        delegate?.didAddIngridient(self, text: text)
        return true
    }
}
