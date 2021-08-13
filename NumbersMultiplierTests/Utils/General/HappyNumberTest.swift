//
//  HappyNumber.swift
//  NumbersMultiplierTests
//
//  Created by Vinícius D. Brandão on 12/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import XCTest
@testable import NumbersMultiplier

class HappyNumberTest: XCTestCase {

    func test_happyNumber() {
        let firstValue = 7
        let secondValue = 2
        
        let viewModel = HappyNumber()
        XCTAssertEqual(viewModel.isHappyNumber(number: firstValue), true)
        XCTAssertEqual(viewModel.isHappyNumber(number: secondValue), false)
    }
    
    func test_numberExists_onGivenContext() {
        let viewModel = HappyNumber()
        
        viewModel.hashTable.insert("1")
        viewModel.hashTable.insert("5")
        viewModel.hashTable.insert("335")
        viewModel.hashTable.insert("2000146")
        
        XCTAssertEqual(viewModel.exists(digits: [100, 121, 3102, 13213]), false)
        XCTAssertEqual(viewModel.exists(digits: [355, 2000146]), false)
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
