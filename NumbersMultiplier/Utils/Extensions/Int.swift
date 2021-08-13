//
//  Int.swift
//  NumbersMultiplier
//
//  Created by Vinícius D. Brandão on 12/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import UIKit

extension Int {
    var isPrime: Bool {
        return self > 1 && !(2..<self).contains { self % $0 == 0 }
    }
}
