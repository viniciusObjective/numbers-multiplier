//
//  Array.swift
//  NumbersMultiplier
//
//  Created by Vinícius D. Brandão on 12/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    typealias ConditionHandler = (Bool, @autoclosure () throws -> Bool) throws -> Bool
       
    func isMultiple(by others: (first: Int, second: Int), with condition: ConditionHandler) -> [Int] {
        var result: [Int] = []
        
        self.forEach { number in
            if try! condition(number.isMultiple(of: others.first), number.isMultiple(of: others.second)) {
                result.append(number)
            }
        }
        
        return result
    }
    
    func isMultiple(by others: (first: Int, second: Int, third: Int), with condition: ConditionHandler) -> [Int] {
        var result: [Int] = []
        
        self.forEach { number in
            guard
                let conditions = try? condition(number.isMultiple(of: others.first), number.isMultiple(of: others.second)) && number.isMultiple(of: others.third)
            else { return }
            
            if conditions { result.append(number) }
        }
        
        return result
    }
    
}

extension Array where Element: Equatable {
    mutating func remove(_ item: Element) {
        guard let index = firstIndex(of: item) else {return}
        remove(at: index)
    }
}
