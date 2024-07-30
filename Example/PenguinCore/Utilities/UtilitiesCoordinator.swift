//
//  UtilitiesCoordinator.swift
//  PenguinCore_Example
//
//  Created by Ade Resie on 29/07/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import PenguinRouting

internal enum UtilitiesPath: String, CaseIterable {
    case home = "/"
    case font = "/font"
    case color = "/color"
    
    var description: String {
        return self.rawValue
    }
    
    static var allCasesAsString: [String] {
        return Self.allCases.map { $0.description }
    }
}

internal final class UtilitiesCoordinator: PenguinRouterCoordinator {
    static var name: String = GlobalPath.utilities.description
    static var paths: [String] = UtilitiesPath.allCasesAsString
    func route(path: String) {
        switch path.lowercased() {
        case UtilitiesPath.home.description:
            let vc = UtilitiesHomeVC()
            navigationController.pushViewController(vc, animated: true)
            
        case UtilitiesPath.font.description:
            let vc = UtilitiesFontVC()
            navigationController.pushViewController(vc, animated: true)
        
        default:
            fatalError(PenguinRouterError.pathNotExist.description)
        }
    }
}
