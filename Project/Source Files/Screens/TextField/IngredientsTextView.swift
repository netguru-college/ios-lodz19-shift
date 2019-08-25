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
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        UITextField.init().delegate = self
        Bundle.main.loadNibNamed("TextField", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        ingredientsTextField.delegate = self
    }
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "IngredientsTextView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    @IBAction func cameraButtonPressed(_ sender: Any) {
        /// here ll be camera button action if added
    }
}
extension IngredientsTextView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        /// checking if text isn't nill
        guard let text = textField.text else {
            return true
        }
        delegate?.didAddIngridient(self, text: text)
        return true
    }
}
