//
//  Ext+UIColor.swift
//  PenguinUtilities
//
//  Created by Ade Resie on 25/07/24.
//

import Foundation

public extension UIColor {
    // Initialize UIColor with hex string
    convenience init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        // Check if the hex string starts with "#"
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        // The hex string should now be 6 or 8 characters long
        let length = hexString.count
        guard length == 6 || length == 8 else {
            return nil
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        if length == 6 {
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: 1.0
            )
        } else if length == 8 {
            self.init(
                red: CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0,
                green: CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0,
                blue: CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0,
                alpha: CGFloat(rgbValue & 0x000000FF) / 255.0
            )
        } else {
            return nil
        }
    }
}
