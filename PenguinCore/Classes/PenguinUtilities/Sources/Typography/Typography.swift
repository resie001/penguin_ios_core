//
//  Typography.swift
//  PenguinUtilities
//
//  Created by Ade Resie on 29/07/24.
//

import Foundation

fileprivate enum FontType: String, CaseIterable {
    case PoppinsBlack          = "Poppins-Black"
    case PoppinsBlackItalic    = "Poppins-BlackItalic"
    case PoppinsBold           = "Poppins-Bold"
    case PoppinsBoldItalic     = "Poppins-BoldItalic"
    case PoppinsExtraBold             = "Poppins-ExtraBold"
    case PoppinsExtraBoldItalic       = "Poppins-ExtraBoldItalic"
    case PoppinsExtraLight       = "Poppins-ExtraLight"
    case PoppinsExtraLightItalic       = "Poppins-ExtraLightItalic"
    case PoppinsItalic       = "Poppins-Italic"
    case PoppinsLightItalic       = "Poppins-LightItalic"
    case PoppinsMedium       = "Poppins-Medium"
    case PoppinsMediumItalic       = "Poppins-MediumItalic"
    case PoppinsRegular       = "Poppins-Regular"
    case PoppinsSemiBold       = "Poppins-SemiBold"
    case PoppinsSemiBoldItalic       = "Poppins-SemiBoldItalic"
    case PoppinsThin       = "Poppins-Thin"
    case PoppinsThinItalic       = "Poppins-ThinItalic"
}

class PenguinFont {
    private static var installed = false
    
    fileprivate static func configureFont(_ font: FontType) -> UIFont {
        PenguinFont.install()
        switch font {
        case .PoppinsRegular:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.systemFont(ofSize: 1)
            
        case .PoppinsItalic:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.italicSystemFont(ofSize: 1)
            
        case .PoppinsMedium:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.systemFont(ofSize: 1)
            
        case .PoppinsMediumItalic:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.italicSystemFont(ofSize: 1)
            
        case .PoppinsBold:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.boldSystemFont(ofSize: 1)
            
        case .PoppinsBoldItalic:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.italicSystemFont(ofSize: 1)
            
        case .PoppinsBlack:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.systemFont(ofSize: 1)
            
        case .PoppinsBlackItalic:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.italicSystemFont(ofSize: 1)
            
        case .PoppinsExtraBold:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.boldSystemFont(ofSize: 1)
            
        case .PoppinsExtraBoldItalic:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.boldSystemFont(ofSize: 1)
            
        case .PoppinsExtraLight:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.systemFont(ofSize: 1)
            
        case .PoppinsExtraLightItalic:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.italicSystemFont(ofSize: 1)
            
        case .PoppinsLightItalic:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.italicSystemFont(ofSize: 1)
            
        case .PoppinsSemiBold:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.boldSystemFont(ofSize: 1)
            
        case .PoppinsSemiBoldItalic:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.boldSystemFont(ofSize: 1)
            
        case .PoppinsThin:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.systemFont(ofSize: 1)
            
        case .PoppinsThinItalic:
            return UIFont(name: font.rawValue, size: 1) ?? UIFont.italicSystemFont(ofSize: 1)
        }
    }
    
    internal static func install() {
        guard PenguinFont.installed == false else { return }
        PenguinFont.installed = true
        
        let primaryBundle = Bundle(for: PenguinFont.self)
        let subBundleUrl = primaryBundle.url(forResource: "PenguinFontResource", withExtension: "bundle")
        if let subBundle = Bundle(url: subBundleUrl!) {
            for font in FontType.allCases {
                if let cfURL = subBundle.url(forResource: font.rawValue, withExtension: "ttf") {
                    CTFontManagerRegisterFontsForURL(cfURL as CFURL, .process, nil)
                } else {
                    assertionFailure("Could not find font:\(FontType.PoppinsRegular.rawValue) in bundle:\(subBundle)")
                }
            }
        }
    }
}

public extension UIFont {
    static func black(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsBlack).withSize(size)
    }
    
    static func blackItalic(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsBlackItalic).withSize(size)
    }
    
    static func bold(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsBold).withSize(size)
    }
    
    static func boldItalic(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsBoldItalic).withSize(size)
    }
    
    static func italic(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsItalic).withSize(size)
    }
    
    static func lightItalic(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsLightItalic).withSize(size)
    }
    
    static func extraBold(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsExtraBold).withSize(size)
    }
    
    static func extraBoldItalic(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsExtraBoldItalic).withSize(size)
    }
    
    static func extraLight(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsExtraLight).withSize(size)
    }
    
    static func extraLightItalic(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsExtraLightItalic).withSize(size)
    }
    
    static func medium(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsMedium).withSize(size)
    }
    
    static func mediumItalic(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsMediumItalic).withSize(size)
    }
    
    static func regular(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsBlack).withSize(size)
    }
    
    static func semiBold(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsSemiBold).withSize(size)
    }
    
    static func semiBoldItalic(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsSemiBoldItalic).withSize(size)
    }
    
    static func thin(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsThin).withSize(size)
    }
    
    static func thinItalic(size: CGFloat) -> UIFont {
        return PenguinFont.configureFont(.PoppinsThinItalic).withSize(size)
    }
}
