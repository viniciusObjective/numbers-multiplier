//
//  HappyNumber.swift
//  NumbersMultiplier
//
//  Created by Vinícius D. Brandão on 12/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import UIKit

class HappyNumber {
    var hashTable = Set<String>()
    
    func isHappyNumber(number: Int) -> Bool {
        var isHappyNumber = false
        var result = false
        var currentValue = number
        
        while !isHappyNumber {
            var digits = [Int]()
            
            while currentValue != 0 {
                digits.append(currentValue % 10)
                currentValue /= 10
            }
            
            if exists(digits: digits) { return false }
            
            digits.forEach( { currentValue += ($0 * $0) } )
            
            if currentValue == 1 {
                isHappyNumber = true
                result = true
            } else if currentValue == 0 {
                isHappyNumber = true
                result = false
            }
        }
        
        return result
    }
    
    func exists(digits: [Int]) -> Bool {
        var hash = ""
        var result: Bool
        digits.sorted().forEach( { hash += "\($0)" } )
        
        if hashTable.contains(hash) {
            result = true
            hashTable = Set<String>()
        } else {
            hashTable.insert(hash)
            result = false
        }
        
        return result
    }
}
