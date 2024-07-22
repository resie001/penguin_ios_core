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
    
    private let decoder = JSONDecoder()
    private let routerRegistry = PenguinRouterRegistry()
    private var navigationController: UINavigationController? = nil
    
    public func register(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func getNavApp() -> UINavigationController {
        guard let nav = navigationController else {
            fatalError("Navigation controller is empty!")
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
    
    public func route<T: Decodable>(
        name: String,
        path: String,
        arguments: [String: Any]? = nil,
        completion: ((Result<T, Error>) -> Void)? = nil
    ) {
        let routerType = routerRegistry.routerType(forNamed: name, forPath: path)
        let router = routerType.init(
            navigationController: getNavApp(),
            arguments: arguments
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                do {
                    let decodedObject = try self.decoder.decode(T.self, from: data)
                    completion?(.success(decodedObject))
                } catch {
                    completion?(.failure(PenguinRouterError.decodingError))
                }
            case .failure(let error):
                completion?(.failure(error))
            }
        }
        
        router.route(path: path)
    }
    
    public func route(
        name: String,
        path: String,
        arguments: [String: Any]? = nil,
        completion: ((Result<Void, Error>) -> Void)? = nil
    ) {
        let routerType = routerRegistry.routerType(forNamed: name, forPath: path)
        let router = routerType.init(
            navigationController: getNavApp(),
            arguments: arguments
        ) { [weak self] result in
            guard let _ = self else { return }
            switch result {
            case .success(let data):
                completion?(.success(()))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
        
        router.route(path: path)
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
        
        router.route(path: path)
    }
}
