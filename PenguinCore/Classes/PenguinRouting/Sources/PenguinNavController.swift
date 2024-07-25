//
//  PenguinNavController.swift
//  PenguinRouting
//
//  Created by Ade Resie on 25/07/24.
//

import Foundation

public final class PenguinNavController: UINavigationController {
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
    }
    
    func push(path: String, animated: Bool) {
        
    }
    
    public override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        super.popToViewController(viewController, animated: animated)
    }
    
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
    }
}
