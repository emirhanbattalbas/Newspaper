//
//  Reusable.swift
//  Aksam
//
//  Created by emirhan battalbaş on 22.03.2020.
//  Copyright © 2020 emirhan battalbaş. All rights reserved.
//

import Foundation
import UIKit

// MARK:- Reusable Protocol
protocol Reusable {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

// MARK:- Reusable Extension

extension Reusable {
    static var reuseIdentifier: String { return String(describing: self) }
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
