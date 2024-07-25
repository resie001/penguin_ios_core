//
//  Ext+String.swift
//  PenguinRouting
//
//  Created by Ade Resie on 25/07/24.
//

import Foundation

public extension String {
    func toData() -> Data {
        return self.data(using: .utf8) ?? Data()
    }
}
