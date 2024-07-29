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
        completion: ((Result<[String: Any], PenguinRouterError>) -> Void)? = nil
    ) {
        let routerType = routerRegistry.routerType(forNamed: name, forPath: path)
        let router = routerType.init(
            navigationController: getNavApp(),
            arguments: arguments
        ) { result in
            debugPrint("<========= Penguin Routing Completion =========>")
            
            switch result {
            case .success(let data):
                guard let value = data.decode(type: [String: Any].self) as? [String: Any] else {
                    fatalError(PenguinRouterError.failureDataType(type: [String: Any].self, data: data).description)
                }
                
                debugPrint("Completion success with Dict: \(value)")
                completion?(.success(value))
            case .failure(let error):
                debugPrint((error.description))
                completion?(.failure(error))
            }
            
            debugPrint("<==============================================>")
            debugPrint()
        }
        
        debugPrint("<============ Penguin Routing Start ===========>")
        
        let fullpath = name + path
        debugPrint("Path: \(fullpath)")
        
        if let arguments = arguments {
            debugPrint("Arguments")
            arguments.forEach { key, value in
                debugPrint("\(key): \(value)")
            }
        }
        
        debugPrint("Completion (Dict & Error)")
        debugPrint("<==============================================>")
        debugPrint()
        
        router.route(path: path)
    }
    
    public func route(
        name: String,
        path: String,
        arguments: [String: Any]? = nil,
        completion: ((Result<Void, PenguinRouterError>) -> Void)? = nil
    ) {
        let routerType = routerRegistry.routerType(forNamed: name, forPath: path)
        let router = routerType.init(
            navigationController: getNavApp(),
            arguments: arguments
        ) { result in
            debugPrint("<========= Penguin Routing Completion =========>")
            
            switch result {
            case .success(let data):
                guard data.isVoid() else {
                    fatalError(PenguinRouterError.failureDataType(type: Void.self, data: data).description)
                }
                
                debugPrint("Completion success")
                completion?(.success(()))
            case .failure(let error):
                debugPrint((error.description))
                completion?(.failure(error))
            }
            
            debugPrint("<==============================================>")
            debugPrint()
        }
        
        debugPrint("<============ Penguin Routing Start ===========>")
        
        let fullpath = name + path
        debugPrint("Path: \(fullpath)")
        
        if let arguments = arguments {
            debugPrint("Arguments")
            arguments.forEach { key, value in
                debugPrint("\(key): \(value)")
            }
        }
        
        debugPrint("Completion (Void & Error)")
        debugPrint("<==============================================>")
        debugPrint()
        
        router.route(path: path)
    }
    
    public func route(
        name: String,
        path: String,
        arguments: [String: Any]? = nil,
        completion: ((Result<String, PenguinRouterError>) -> Void)? = nil
    ) {
        let routerType = routerRegistry.routerType(forNamed: name, forPath: path)
        let router = routerType.init(
            navigationController: getNavApp(),
            arguments: arguments
        ) { result in
            debugPrint("<========= Penguin Routing Completion =========>")
            
            switch result {
            case .success(let data):
                guard data.isString(), let value = data.decode(type: String.self) as? String else {
                    fatalError(PenguinRouterError.failureDataType(type: String.self, data: data).description)
                }
                
                debugPrint("Completion success with String: \(value)")
                completion?(.success(value))
            case .failure(let error):
                debugPrint((error.description))
                completion?(.failure(error))
            }
            
            debugPrint("<==============================================>")
            debugPrint()
        }
        
        debugPrint("<============ Penguin Routing Start ===========>")
        
        let fullpath = name + path
        debugPrint("Path: \(fullpath)")
        
        if let arguments = arguments {
            debugPrint("Arguments")
            arguments.forEach { key, value in
                debugPrint("\(key): \(value)")
            }
        }
        
        debugPrint("Completion (String & Error)")
        debugPrint("<==============================================>")
        debugPrint()
        
        router.route(path: path)
    }
    
    public func route(
        name: String,
        path: String,
        arguments: [String: Any]? = nil,
        completion: ((Result<Bool, PenguinRouterError>) -> Void)? = nil
    ) {
        let routerType = routerRegistry.routerType(forNamed: name, forPath: path)
        let router = routerType.init(
            navigationController: getNavApp(),
            arguments: arguments
        ) { result in
            debugPrint("<========= Penguin Routing Completion =========>")
            
            switch result {
            case .success(let data):
                guard data.isBool(), let value = data.decode(type: Bool.self) as? Bool else {
                    fatalError(PenguinRouterError.failureDataType(type: Bool.self, data: data).description)
                }
                
                debugPrint("Completion success with Bool: \(value)")
                completion?(.success(value))
            case .failure(let error):
                debugPrint((error.description))
                completion?(.failure(error))
            }
            
            debugPrint("<==============================================>")
            debugPrint()

        }
        
        debugPrint("<============ Penguin Routing Start ===========>")
        
        let fullpath = name + path
        debugPrint("Path: \(fullpath)")
        
        if let arguments = arguments {
            debugPrint("Arguments")
            arguments.forEach { key, value in
                debugPrint("\(key): \(value)")
            }
        }
        
        debugPrint("Completion (Bool & Error)")
        debugPrint("<==============================================>")
        debugPrint()
        
        router.route(path: path)
    }
    
    public func route(
        name: String,
        path: String,
        arguments: [String: Any]? = nil,
        completion: ((Result<Float, PenguinRouterError>) -> Void)? = nil
    ) {
        let routerType = routerRegistry.routerType(forNamed: name, forPath: path)
        let router = routerType.init(
            navigationController: getNavApp(),
            arguments: arguments
        ) { result in
            debugPrint("<========= Penguin Routing Completion =========>")
            
            switch result {
            case .success(let data):
                guard data.isFloat(), let value = data.decode(type: Float.self) as? Float else {
                    fatalError(PenguinRouterError.failureDataType(type: Float.self, data: data).description)
                }
                
                debugPrint("Completion success with Float: \(value)")
                completion?(.success(value))
            case .failure(let error):
                debugPrint((error.description))
                completion?(.failure(error))
            }
            
            debugPrint("<==============================================>")
            debugPrint()

        }
        
        debugPrint("<============ Penguin Routing Start ===========>")
        
        let fullpath = name + path
        debugPrint("Path: \(fullpath)")
        
        if let arguments = arguments {
            debugPrint("Arguments")
            arguments.forEach { key, value in
                debugPrint("\(key): \(value)")
            }
        }
        
        debugPrint("Completion (Float & Error)")
        debugPrint("<==============================================>")
        debugPrint()
        
        router.route(path: path)
    }
    
    public func route(
        name: String,
        path: String,
        arguments: [String: Any]? = nil,
        completion: ((Result<Int, PenguinRouterError>) -> Void)? = nil
    ) {
        let routerType = routerRegistry.routerType(forNamed: name, forPath: path)
        let router = routerType.init(
            navigationController: getNavApp(),
            arguments: arguments
        ) { result in
            debugPrint("<========= Penguin Routing Completion =========>")
            
            switch result {
            case .success(let data):
                guard data.isInt(), let value = data.decode(type: Int.self) as? Int else {
                    fatalError(PenguinRouterError.failureDataType(type: Int.self, data: data).description)
                }
                
                debugPrint("Completion success with Int: \(value)")
                completion?(.success(value))
            case .failure(let error):
                debugPrint((error.description))
                completion?(.failure(error))
            }
            
            debugPrint("<==============================================>")
            debugPrint()

        }
        
        debugPrint("<============ Penguin Routing Start ===========>")
        
        let fullpath = name + path
        debugPrint("Path: \(fullpath)")
        
        if let arguments = arguments {
            debugPrint("Arguments")
            arguments.forEach { key, value in
                debugPrint("\(key): \(value)")
            }
        }
        
        debugPrint("Completion (Int & Error)")
        debugPrint("<==============================================>")
        debugPrint()
        
        router.route(path: path)
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
            debugPrint("<========= Penguin Routing Completion =========>")
            
            switch result {
            case .success(let data):
                completion?(.success(data))
            case .failure(let error):
                completion?(.failure(error))
            }
            
            debugPrint("<==============================================>")
            debugPrint()

        }
        
        debugPrint("<============ Penguin Routing Start ===========>")
        
        let fullpath = name + path
        debugPrint("Path: \(fullpath)")
        
        if let arguments = arguments {
            debugPrint("Arguments")
            arguments.forEach { key, value in
                debugPrint("\(key): \(value)")
            }
        }
        
        debugPrint("<==============================================>")
        debugPrint()
        
        router.route(path: path)
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
        
        debugPrint("<============ Penguin Routing Start ===========>")
        
        let fullpath = name + path
        debugPrint("Path: \(fullpath)")
        
        if let arguments = arguments {
            debugPrint("Arguments")
            arguments.forEach { key, value in
                debugPrint("\(key): \(value)")
            }
        }
        
        debugPrint("<==============================================>")
        debugPrint()
        
        router.route(path: path)
    }
    
    public func back() {
        getNavApp().popViewController(animated: true)
    }
    
    public func dismiss(completion: (() -> Void)? = nil) {
        getNavApp().dismiss(animated: true, completion: completion)
    }
}

