//
//  Color.swift
//  PenguinUtilities
//
//  Created by Ade Resie on 25/07/24.
//

import UIKit

public enum PenguinColors {
    case primary
    case background
    
    case title
    case font
    
    func color() -> UIColor {
        switch (self, UIApplication.currentTheme()) {
        case (.primary, .light), (.primary, .unspecified):
            return UIColor.init(hex: "#31AFC6")!
        
        case (.background, .light), (.background, .unspecified):
            return .white
            
        case (.title, .light), (.title, .unspecified):
            return .white
        
        default:
            return .white
        }
    }
}
