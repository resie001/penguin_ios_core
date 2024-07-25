//
//  Ext+Dict.swift
//  PenguinRouting
//
//  Created by Ade Resie on 25/07/24.
//

import Foundation

public extension Dictionary {
    func toData() -> Data {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            return jsonData
        } catch {
            fatalError("")
        }
    }
}
