//
//  IngredientTextField.swift
//  NetguruCollegeApp
//

import UIKit

@IBDesignable
class IngredientTextField: UITextField {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    @IBInspectable var textLeadingInset: CGFloat = 6 {
        didSet {
            layoutIfNeeded()
        }
    }

    // update placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: textLeadingInset, dy: 0)
    }

    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: textLeadingInset, dy: 0)
    }
}
