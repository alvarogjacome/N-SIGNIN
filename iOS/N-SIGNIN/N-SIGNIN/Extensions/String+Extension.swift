//
//  String+Extension.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 16/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

extension String {
    func emptyString() -> String? {
        self.isEmpty ? nil : self
    }
}
