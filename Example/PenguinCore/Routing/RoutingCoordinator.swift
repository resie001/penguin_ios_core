//
//  RoutingHomeRouter.swift
//  PenguinCore_Example
//
//  Created by Ade Resie on 22/07/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import PenguinRouting

internal enum RoutingPath: String, CaseIterable {
    case home = "/"
    case basic = "/basic"
    case withParameter = "/with-parameter"
    case withBasicCompletion = "/with-basic-completion"
    case withCustomCompletion = "/with-custom-completion"
    
    case stringCompletion = "/with-custom-completion/string"
    case boolCompletion = "/with-custom-completion/bool"
    case intCompletion = "/with-custom-completion/int"
    case floatCompletion = "/with-custom-completion/float"
    case dictCompletion = "/with-custom-completion/dict"
    
    var description: String {
        return self.rawValue
    }
    
    static var allCasesAsString: [String] {
        return Self.allCases.map { $0.description }
    }
}

internal final class RoutingCoordinator: PenguinRouterCoordinator {
    public static var name: String = GlobalPath.routing.description
    public static var paths: [String] = RoutingPath.allCasesAsString
    
    public func route(path: String) {
        let vc: UIViewController
        
        switch path.lowercased() {
        case RoutingPath.home.description:
            vc = RoutingHomeVC()
            
        case RoutingPath.basic.description:
            vc = RoutingBasicVC()
            
        case RoutingPath.withParameter.description:
            vc = RoutingParameterVC.create(coordinator: self)
            
        case RoutingPath.withBasicCompletion.description:
            vc = RoutingBasicCompletionVC.create(coordinator: self)
            
        case RoutingPath.withCustomCompletion.description:
            vc = RoutingCustomCompletionVC.create(coordinator: self)
            
        case RoutingPath.intCompletion.description:
            vc = CustomRoutingIntVC.create(coordinator: self)
            
        case RoutingPath.floatCompletion.description:
            vc = CustomRoutingFloatVC.create(coordinator: self)
            
        case RoutingPath.boolCompletion.description:
            vc = CustomRoutingBoolVC.create(coordinator: self)
            
        case RoutingPath.stringCompletion.description:
            vc = CustomRoutingStringVC.create(coordinator: self)
            
        case RoutingPath.dictCompletion.description:
            vc = CustomRoutingDictVC.create(coordinator: self)
            
        default:
            fatalError(PenguinRouterError.pathNotExist.description)
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
}
