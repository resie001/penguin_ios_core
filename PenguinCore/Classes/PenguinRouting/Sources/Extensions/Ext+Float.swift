//
//  Ext+Float.swift
//  PenguinRouting
//
//  Created by Ade Resie on 25/07/24.
//

import Foundation

public extension Float {
    func toData() -> Data {
        var float = self
        return Data(bytes: &float, count: MemoryLayout<Float>.size)
    }
}
