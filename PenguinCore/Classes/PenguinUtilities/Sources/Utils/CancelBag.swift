//
//  CancelBag.swift
//  PenguinUtilities
//
//  Created by Ade Resie on 25/07/24.
//

import Combine

public class CancelBag {
    public var subscriptions = Set<AnyCancellable>()
    
    public func cancel() {
        subscriptions.forEach { $0.cancel() }
        subscriptions.removeAll()
    }
    
    public init() {}
}

extension AnyCancellable {
    public func store(in cancelBag: CancelBag) {
        cancelBag.subscriptions.insert(self)
    }
}
