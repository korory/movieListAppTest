//
//  BaseInteractor.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 05/05/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation
import UIKit

class BaseInteractor <T> {
    
    internal var presenter: T?

    convenience init(presenter: T) {
        self.init()
        self.presenter = presenter
    }
}
