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

    @IBInspectable var rightImage: UIImage? {
        didSet {
            let imageView = UIImageView(image: rightImage)
            imageView.contentMode = .left
            self.rightView = imageView
            self.rightViewMode = .always
        }
    }

    @IBInspectable var rightImageTrailingInset: CGFloat = 6 {
        didSet {
            guard let rightImage = self.rightView else { return }
            rightImage.frame = rightImage.frame.inset(by: UIEdgeInsets(top: 0,
                                                                       left: 0,
                                                                       bottom: 0,
                                                                       right: -rightImageTrailingInset))
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
