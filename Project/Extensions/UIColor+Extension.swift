//
//  UIColor.swift
//  NetguruCollegeApp
//
import UIKit

extension UIColor {
    
    static let defaultGreen = UIColor.with(hex: 0x2AC503)
    
    /// Return an instance of UIColors from a given hex number
    /// Parameter hex: The hex value of the color object.
    /// Returns: The color object.
    static func with(hex: Int) -> UIColor {
        return color(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
    
    /// Initializes and returns a color object using the specified opacity and RGB component values.
    /// - Parameters:
    ///     - red: The red value of the color object.
    ///     - green: The green value of the color object.
    ///     - blue: The blue value of the color object.
    ///     - alpha: The opacity value of the color object.
    /// Returns: The color object.
    static func color(red: Int, green: Int, blue: Int, alpha: Int = 0xFF) -> UIColor {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
    
}
