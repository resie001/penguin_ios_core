//
//  Ext+Int.swift
//  PenguinRouting
//
//  Created by Ade Resie on 25/07/24.
//

import Foundation

public extension Int {
    func toData() -> Data {
        var int = self
        return Data(bytes: &int, count: MemoryLayout<Int>.size)
    }
}
