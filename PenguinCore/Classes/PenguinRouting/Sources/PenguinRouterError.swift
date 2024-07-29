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
    case failureWithMessage(message: String)
    case failureDataType(type: Any, data: Data)
    
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
        case let .failureWithMessage(message):
            return "Falure completion with message: \(message)"
        case let .failureDataType(type, data):
            var str = ""
            switch type {
            case is Int:
                str = "Int"
            case is Bool:
                str = "Bool"
            case is Float:
                str = "Float"
            case is String:
                str = "String"
            case is Void:
                str = "Void"
            default:
                str = "Dictionary"
            }
            return "Completion success error. Data is not \(str). Data is \(detectType(data: data))!"
        
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
    
    internal func detectType(data: Data) -> String {
        if data.isInt() {
            return "Int"
        }
        
        if data.isBool() {
            return "Bool"
        }
        
        if data.isFloat() {
            return "Float"
        }
        
        if data.isString() {
            return "String"
        }
        
        if data.isEmpty {
            return "Void"
        }
        
        return "Dictionary"
    }
    
    public var debugDescription: String {
        return description
    }
}
