//
//  PenguinBaseVM.swift
//  PenguinUtilities
//
//  Created by Ade Resie on 25/07/24.
//

import Foundation

public protocol PenguinBaseVM {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input, cancellables: CancelBag) -> Output
}
