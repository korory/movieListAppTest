//
//  AppAssembly.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation
import UIKit

protocol AppAssemblyProtocol:class {
    func applicationShowInitViewController(window: UIWindow?)
}

final class AppAssembly: AppAssemblyProtocol {
    private (set) var actualViewController: UIViewController!
    
    internal func applicationShowInitViewController(window: UIWindow?) {
        self.actualViewController = FindMyMovieAssembly.movieListViewController()
        window?.rootViewController = self.actualViewController
        window?.makeKeyAndVisible()
    }
}

