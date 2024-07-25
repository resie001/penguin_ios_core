//
//  Ext+Bool.swift
//  PenguinRouting
//
//  Created by Ade Resie on 25/07/24.
//

import Foundation

public extension Bool {
    func toData() -> Data {
        var bool = self
        return Data(bytes: &bool, count: MemoryLayout<Bool>.size)
    }
}
