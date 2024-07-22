//
//  PenguinParameter.swift
//  PenguinRouting
//
//  Created by Ade Resie on 16/07/24.
//

import Foundation

public typealias PenguinRouteValue = Decodable

public typealias PenguinParameter = Codable

extension Decodable where Self: PenguinParameter {
    public func toRouteValue<T: PenguinRouteValue>(to type: T.Type) -> T? {
        do {
            let data = try JSONEncoder().encode(self)
            let decoded = try JSONDecoder().decode(type, from: data)
            return decoded
        } catch {
            return nil
        }
    }
    
    public func toRouteValueResult<T: PenguinRouteValue>(to type: T.Type) -> Result<T, Error> {
        do {
            let data = try JSONEncoder().encode(self)
            let decoded = try JSONDecoder().decode(type, from: data)
            return .success(decoded)
        } catch {
            return .failure(error)
        }
    }
}
