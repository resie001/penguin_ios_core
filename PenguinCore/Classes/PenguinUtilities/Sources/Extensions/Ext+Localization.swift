//
//  Ext+Localization.swift
//  PenguinUtilities
//
//  Created by Ade Resie on 29/07/24.
//

import Foundation

public struct Language {
    public let id: String
    public let en: String

    public init(en: String = "", id: String = "") {
        self.id = id
        self.en = en
    }
}

extension Language {
    public static func systemLanguage() -> String {
        String(Locale.preferredLanguages[0].prefix(2))
    }
}

public extension String {
    static func localizeString(_ language: Language) -> String {
        switch Language.systemLanguage() {
        case "id":
            return language.id
        case "en":
            return language.en
        default:
            return language.en
        }
    }
}
