//
//  Ext+UIApplication.swift
//  PenguinUtilities
//
//  Created by Ade Resie on 25/07/24.
//

import Foundation

public extension UIApplication {
    static func currentTheme() -> UIUserInterfaceStyle {
        if let keyWindow = self.shared.windows.first(where: { $0.isKeyWindow }) {
            return keyWindow.traitCollection.userInterfaceStyle
        }
        return UITraitCollection.current.userInterfaceStyle
    }

}
