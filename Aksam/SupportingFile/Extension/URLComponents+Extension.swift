//
//  URLQueryItem+Extension.swift
//  YemekSepetiCase
//
//  Created by emirhan battalbaş on 21.01.2020.
//  Copyright © 2020 emirhan battalbaş. All rights reserved.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
