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
    
    case navigationControllerEmpty
    
    case unauthorizedPath(path:String, reason: String)
    
    case emptyFailure
    case failureWithString(data: String)
    case failureWithBool(data: Bool)
    case failureWithFloat(data: Float)
    case failureWithInt(data: Int)
    case failureWithArguments(data: [String: Any])
    
    case routeNotExist
    case routeAlreadyExist
    case routerNameEmpty
    case routerNameInvalid(name: String)
    
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
            
        case .navigationControllerEmpty:
            return "Navigation Controller is empty!"
            
        case let .unauthorizedPath(path, reason):
            return "Unauthorized Route for path \"\(path)\" cause \"\(reason)\""
            
        case .emptyFailure:
            return "Failure completion"
        case .failureWithString:
            return "Failure completion with String data"
        case .failureWithInt:
            return "Failure completion with Int data"
        case .failureWithFloat:
            return "Failure completion with Float data"
        case .failureWithBool:
            return "Failure completion with Bool data"
        case .failureWithArguments:
            return "Failure completion with Arguments data"
        
        case .routeNotExist:
            return "Route not found!"
        case .routeAlreadyExist:
            return "Route already exist!"
        case .routerNameEmpty:
            return "Router name cannot be empty!"
        case .routerNameInvalid(let name):
            return "Router name \"\(name)\" have invalid format!. Use only lowercased alphabet and (-)."
            
        
        case .pathNotExist:
            return "Path not found!"
        case .pathAlreadyExist:
            return "Path already exist!"
        case let .pathInvalid(path):
            return "Path \"\(path)\" have invalid format!. First char must be \"/\" and use only lowercased alphabet and (-)."
        }
    }
    
    public var debugDescription: String {
        return description
    }
}
