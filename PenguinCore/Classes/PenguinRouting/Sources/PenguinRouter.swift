//
//  PenguinRouter.swift
//  PenguinRouting
//
//  Created by Ade Resie on 16/07/24.
//

import UIKit
import Foundation

public protocol PenguinRouter {
    static var name: String { get }
    static var paths: [String] { get }
    func route(path: String)
}

open class PenguinCoordinator: NSObject {
    public var navigationController: UINavigationController
    public var completion: ((Result<Data, Error>) -> Void)?
    public var arguments: [String: Any]?
    
    public required init(
        navigationController: UINavigationController,
        arguments: [String: Any]? = nil,
        completion: ((Result<Data, Error>) -> Void)? = nil
    ) {
        self.navigationController = navigationController
        self.arguments = arguments
        self.completion = completion
    }
}

public typealias PenguinRouterCoordinator = PenguinRouter & PenguinCoordinator
