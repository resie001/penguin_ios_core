//
//  PenguinPath.swift
//  PenguinRouting
//
//  Created by Ade Resie on 16/07/24.
//

import Foundation

public protocol PenguinPath: CaseIterable, CustomStringConvertible {}

public extension PenguinPath {
    static var allCasesAsString: [String] {
        return Self.allCases.map { $0.description }
    }
}
