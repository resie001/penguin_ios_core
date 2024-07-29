//
//  Color.swift
//  PenguinUtilities
//
//  Created by Ade Resie on 25/07/24.
//

import UIKit

public extension UIColor {
    static let primary = UIColor(light: UIColor(hex: "31AFC6"), dark: UIColor(hex: "31AFC6"))
    
    enum Background {
        case white
        case dashboard
        
        public var color: UIColor {
            switch self {
            case .white:
                return UIColor(light: UIColor(hex: "FFFFFF"), dark: UIColor(hex: "FFFFFF"))
            case .dashboard:
                return UIColor(light: UIColor(hex: "F5F5F5"), dark: UIColor(hex: "F5F5F5"))
            }
        }
    }
    
    enum Label {
        case title
        case subtitle
        
        public var color: UIColor {
            switch self {
            case .title:
                return UIColor(light: UIColor(hex: "25282B"), dark: UIColor(hex: "25282B"))
            case .subtitle:
                return UIColor(light: UIColor(hex: "52575C"), dark: UIColor(hex: "52575C"))
            }
        }
    }

    enum TextField {
        case placeholder
        case value
        
        public var color: UIColor {
            switch self {
            case .placeholder:
                return UIColor(light: UIColor(hex: "CACCCF"), dark: UIColor(hex: "CACCCF"))
            case .value:
                return UIColor(light: UIColor(hex: "25282B"), dark: UIColor(hex: "25282B"))
            }
        }
    }
    
    enum Button {
        case active
        case disabled
        
        public var color: UIColor {
            switch self {
            case .active:
                return UIColor(light: UIColor(hex: "31AFC6"), dark: UIColor(hex: "31AFC6"))
            case .disabled:
                return UIColor(light: UIColor(hex: "CACCCF"), dark: UIColor(hex: "CACCCF"))
            }
        }
    }
    
    static let red = UIColor(light: UIColor(hex: "E52A34"), dark: UIColor(hex: "E52A34"))
    static let green = UIColor(light: UIColor(hex: "31B057"), dark: UIColor(hex: "31B057"))
}
