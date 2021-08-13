//
//  Int.swift
//  NumbersMultiplierTests
//
//  Created by Vinícius D. Brandão on 12/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import XCTest
@testable import NumbersMultiplier

class IntTests: XCTestCase {
    
    func test_isPrime() {
        let prime = 7919
        let notPrime = 1333
        
        XCTAssert(prime.isPrime)
        XCTAssertFalse(notPrime.isPrime)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
