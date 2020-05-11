//
//  BaseViewController.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController<T>: UIViewController {
    var presenter: T?
}
