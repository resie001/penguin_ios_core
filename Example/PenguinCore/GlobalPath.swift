//
//  GlobalPath.swift
//  PenguinCore_Example
//
//  Created by Ade Resie on 22/07/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation

internal enum GlobalPath: String, CaseIterable {
    case routing = "/routing"
    case utilities = "/utilities"
    
    var description: String {
        return self.rawValue
    }
    
    static var allCasesString: [String] {
        return allCases.map { $0.description }
    }
}
