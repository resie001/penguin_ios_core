//
//  RoutingHomeRouter.swift
//  PenguinCore_Example
//
//  Created by Ade Resie on 22/07/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import PenguinRouting

public enum RoutingPath: String, CaseIterable {
    case home = "/home"
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

public final class RoutingCoordinator: PenguinRouterCoordinator {
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
            
        default:
            fatalError(PenguinRouterError.pathNotExist.description)
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
}
