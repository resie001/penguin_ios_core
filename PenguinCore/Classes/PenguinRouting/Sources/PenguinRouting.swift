//
//  PenguinRouting.swift
//  PenguinRouting
//
//  Created by Ade Resie on 16/07/24.
//

import Foundation
import UIKit

public class PenguinRouting {
    private init() {}
    
    public static let shared = PenguinRouting()
    private var paths: [String] = []
    
    private let decoder = JSONDecoder()
    private let routerRegistry = PenguinRouterRegistry()
    
    public func getNavApp() -> UINavigationController {
        guard let nav = UIApplication.shared.topNavigationController else {
            fatalError(PenguinRouterError.navigationControllerEmpty.description)
        }
        
        return nav
    }
    
    public func register(routerType: PenguinRouterCoordinator.Type) {
        routerRegistry.register(router: routerType)
    }
    
    public func register(_ routerTypes: PenguinRouterCoordinator.Type...) {
        for routerType in routerTypes {
            routerRegistry.register(router: routerType)
        }
    }
    
    public func removeAll() {
        routerRegistry.removeAllRouters()
    }
    
    public func route(
        name: String,
        path: String,
        arguments: [String: Any]? = nil,
        completion: ((Result<Data, PenguinRouterError>) -> Void)? = nil
    ) {
        let routerType = routerRegistry.routerType(forNamed: name, forPath: path)
        let router = routerType.init(
            navigationController: getNavApp(),
            arguments: arguments
        ) { result in
            switch result {
            case .success(let data):
                completion?(.success(data))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
        
        let vc = router.route(path: path)
        getNavApp().pushViewController(vc, animated: true)
    }
    
    public func checkExistingPath() {
        
    }
    
    public func route(
        name: String,
        path: String,
        arguments: [String: Any]? = nil
    ) {
        let routerType = routerRegistry.routerType(forNamed: name, forPath: path)
        let router = routerType.init(
            navigationController: getNavApp(),
            arguments: arguments
        )
        let vc = router.route(path: path)
        getNavApp().pushViewController(vc, animated: true)
    }
    
    public func back() {
        getNavApp().popViewController(animated: true)
    }
    
    public func dismiss(completion: (() -> Void)? = nil) {
        getNavApp().dismiss(animated: true, completion: completion)
    }
}

