//
//  Ext+UIApplication.swift
//  PenguinRouting
//
//  Created by Ade Resie on 25/07/24.
//

import Foundation

extension UIApplication {
    var topNavigationController: UINavigationController? {
        return keyWindow?.rootViewController?.topNavigationController
    }
}

extension UIViewController {
    var topNavigationController: UINavigationController? {
        if let navigationController = self as? UINavigationController {
            return navigationController
        } else if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController?.topNavigationController
        } else if let presentedViewController = presentedViewController {
            return presentedViewController.topNavigationController
        } else {
            return self.parent?.topNavigationController
        }
    }
}
