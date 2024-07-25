//
//  Ext+Data.swift
//  PenguinRouting
//
//  Created by Ade Resie on 25/07/24.
//

import Foundation

public extension Data {
    func decode<T>(type: T.Type) -> Any {
        switch type {
        case is Int.Type:
            guard self.count == MemoryLayout<Int>.size else { fatalError() }
            return self.withUnsafeBytes { $0.load(as: Int.self) }
            
        case is Float.Type:
            guard self.count == MemoryLayout<Float>.size else { fatalError() }
            return self.withUnsafeBytes { $0.load(as: Float.self) }
            
        case is Bool.Type:
            guard self.count == MemoryLayout<Bool>.size else { return false }
            return self.withUnsafeBytes { $0.load(as: Bool.self) }
            
        case is String.Type:
            guard let str = String(data: self, encoding: .utf8) else { fatalError() }
            return str
            
        case is [String: Any].Type:
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: self, options: [])
                guard let dictionary = jsonObject as? [String: Any] else {
                    fatalError("Data is not a valid JSON dictionary")
                }
                return dictionary
            } catch {
                fatalError("JSON decoding failed: \(error)")
            }
            
        default:
            fatalError("")
        }
    }
}