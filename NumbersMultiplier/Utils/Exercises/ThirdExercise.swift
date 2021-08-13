//
//  ThirdExercise.swift
//  NumbersMultiplier
//
//  Created by Vinícius D. Brandão on 12/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import Foundation

class ThirdExercise {
    private var happyNumber = HappyNumber()
    
    func execute() {
        let given = "Teste"
        print("The given word is: " + given)
        var numberValue = [Int]()
        
        LetterToNumber.value.forEach { arg in
            let (char, value) = arg
            
            if given.contains(where: {$0 == char }) {
                print("\(char) has the value of \(value)")
                numberValue.append(value)
            }
        }
        
        let totalAmount = numberValue.reduce(0, +)
        print("The total amount for the given word is: \(totalAmount)")
        
        print("The given word value is a happyNumber? \n" + String(happyNumber.isHappyNumber(number: totalAmount)))
        print("The given word value is a prime number? \n" + String(totalAmount.isPrime))
        print("The given word value is multiple of 3 or 5? \n" + String(totalAmount.isMultiple(of: 3) || totalAmount.isMultiple(of: 5)))
    }
}
