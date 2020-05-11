//
//  BaseRouter.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation
import UIKit

class BaseRouter<T> {
    internal var viewController: UIViewController?
    internal var presenter: T?
    
    convenience init(viewController: UIViewController? = nil, presenter: T? = nil) {
        self.init()
        self.viewController = viewController
        self.presenter = presenter
    }
    
    internal func show(_ vc: UIViewController){
        
        if let navigationController = viewController?.navigationController {
            
            navigationController.pushViewController(vc, animated: true)
            
        }
        
    }
    
    internal func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        
        if let navigationController = viewController?.navigationController {
            
            navigationController.present(viewControllerToPresent, animated: flag, completion: completion)
            
            return
            
        }
        
        viewController?.present(viewControllerToPresent, animated: flag, completion: completion)
        
    }
    
    // MARK: PRIVATE BASE
    internal func rootViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        if let navigationController = self.viewController?.navigationController {
            navigationController.setViewControllers([viewControllerToPresent], animated: flag)
        }
    }
    
    internal func pushViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        if let navigationController = self.viewController?.navigationController {
            DispatchQueue.main.async {
                navigationController.pushViewController(viewControllerToPresent, animated: flag)
            }
        }
    }
    
    internal func popViewController(animated: Bool) {
        if let navigationController = self.viewController?.navigationController {
            navigationController.popViewController(animated: animated)
        }
    }
    
    internal func popToViewController(toViewController: UIViewController, animated: Bool) {
        if let navigationController = self.viewController?.navigationController {
            navigationController.popToViewController(toViewController, animated: animated)
        }
    }
    
    //        internal func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
    //            self.viewController?.present(viewControllerToPresent, animated: flag, completion: completion)
    //        }
    
    internal func dismiss(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        self.viewController?.dismiss(animated: flag, completion: completion)
    }
}

