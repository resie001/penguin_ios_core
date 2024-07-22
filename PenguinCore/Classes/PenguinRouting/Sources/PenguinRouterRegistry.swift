//
//  RouterRegistry.swift
//  PenguinRouterRegistry
//
//  Created by Ade Resie on 16/07/24.
//

import Foundation

final class PenguinRouterRegistry {
    private var registeredRouter = [String: PenguinRouterCoordinator.Type]()
    
    func register(router: PenguinRouterCoordinator.Type) {
        let name = router.name
        
        guard name != ""
        else {
            fatalError(PenguinRouterError.routerNameEmpty.description)
        }
        
        guard hasDuplicates(in: router.paths) else {
            fatalError(PenguinRouterError.pathAlreadyExist.description)
        }
        
        router.paths.forEach {
            guard isValidInput($0) else {
                fatalError(PenguinRouterError.pathInvalid(path: $0).description)
            }
        }
        
        if registeredRouter[name] != nil {
            fatalError(PenguinRouterError.routeAlreadyExist.description)
        } else {
            registeredRouter[name] = router
        }
    }
    
    func routerType(forNamed name: String, forPath path: String) -> PenguinRouterCoordinator.Type {
        guard let router = registeredRouter[name] else {
            fatalError(PenguinRouterError.routeNotExist.description)
        }
        
        return  router
    }
    
    func removeAllRouters() {
        registeredRouter.removeAll()
    }
    
    func hasDuplicates<T: Hashable>(in array: [T]) -> Bool {
        var seenElements = Set<T>()
        for element in array {
            if seenElements.contains(element) {
                return true
            } else {
                seenElements.insert(element)
            }
        }
        return false
    }
    
    func isValidInput(_ input: String) -> Bool {
        let pattern = "^(?!-)[a-zA-Z/\\-]*(?!.*[/]{2})(?!.*[-]{2})(?<![-/])[^\\s]*$"
        let regexTest = NSPredicate(format: "SELF MATCHES %@", pattern)
        return regexTest.evaluate(with: input)
    }
}
