//
//  String+Extension.swift
//  YemekSepetiCase
//
//  Created by emirhan battalbaş on 18.01.2020.
//  Copyright © 2020 emirhan battalbaş. All rights reserved.
//

import Foundation

extension String {

    func voteParsing() -> (String, String) {
        
        guard self.components(separatedBy: ".").count > 1 else {
            return (self, ".0")
        }
        let first = self.components(separatedBy: ".")[0]
        let second = "." + self.components(separatedBy: ".")[1]

        return (first,second)
        
    }
}
