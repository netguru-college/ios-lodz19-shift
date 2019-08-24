//
//  UIColor.swift
//  NetguruCollegeApp
//
import UIKit

extension UIColor {
    /// Creates an instance of UIColor from given hexadecimal number given as a String.
    /// Fails if given parameter is inncorect hexadecimal number.
    ///
    /// - Parameters:
    ///   - hexString: a hex representation of color. 3, 6 or 8 characters with or without a '#'
    convenience init?(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        let red, green, blue, alpha: CGFloat
        switch chars.count {
        case 3:
            chars = chars.flatMap { [$0, $0] }
            fallthrough
        case 6:
            chars = ["F", "F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            return nil
        }
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    static let defaultGreen = UIColor(hexString: "2AC503")
}
