//
//  PenguinRouterError.swift
//  PenguinRouting
//
//  Created by Ade Resie on 16/07/24.
//

import Foundation

public enum PenguinRouterError: Error {
    case encodingError
    case decodingError
    case noMatchingRoute
    case routeAlreadyExists
    case notAcceptableRoutePath
    case parameterNotProvided
    case notAcceptableParameter
    
    case routeNotExist
    case routeAlreadyExist
    case routerNameEmpty
    
    case pathNotExist
    case pathAlreadyExist
    case pathInvalid(path: String)
}

extension PenguinRouterError: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        switch self {
        case .decodingError:
            return "Decoding error"
        case .encodingError:
            return "Encoding error"
        case .noMatchingRoute:
            return "No matching route"
        case .routeAlreadyExists:
            return "Route already exists"
        case .notAcceptableRoutePath:
            return "Route path not acceptable"
        case .parameterNotProvided:
            return "Parameter not provided"
        case .notAcceptableParameter:
            return "Parameter not acceptable"
        
        case .routeNotExist:
            return "Route not found!"
        case .routeAlreadyExist:
            return "Route already exist!"
        case .routerNameEmpty:
            return "Router name cannot be empty!"
            
        
        case .pathNotExist:
            return "Path not found!"
        case .pathAlreadyExist:
            return "Path already exist!"
        case let .pathInvalid(path):
            return "Path \(path) have invalid format!"
        }
    }

    /**
        A textual representation of the error for debugging purposes.
     
        - Returns:
            The same human-readable description as `description`.
     */
    public var debugDescription: String {
        return description
    }
}
