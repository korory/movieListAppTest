//
//  BasePresenter.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation

class BasePresenter <T, U> {
    internal var viewController: T?
    internal var router: U?
    
    convenience init(viewController: T, router: U? = nil) {
        self.init()
        self.viewController = viewController
        self.router = router
    }
}
