//
//  Array.swift
//  NumbersMultiplierTests
//
//  Created by Vinícius D. Brandão on 12/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import XCTest
@testable import NumbersMultiplier

class ArrayTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ForGivenRange_isEqualToOR() {
        //given
        let array = [Int](0..<1000)
        
        //when
        let multiplier = array.isMultiple(by: (first: 3, second: 5), with: ||)
        let sumResult = multiplier.reduce(array.first!, +)
        
        //then
        XCTAssertEqual(sumResult, 233168)
    }
    
    func test_ForGivenRange_isEqualToAnd() {
        //given
        let array = [Int](0..<1000)
        
        //when
        let multiplier = array.isMultiple(by: (first: 3, second: 5), with: &&)
        let sumResult = multiplier.reduce(array.first!, +)
        
        //then
        XCTAssertEqual(sumResult, 33165)
    }
    
    func test_ForGivenRange_isEqualToOR_withThirdElement() {
        //given
        let array = [Int](0..<1000)
        
        //when
        let multiplier = array.isMultiple(by: (first: 3, second: 5, third: 7), with: ||)
        let sumResult = multiplier.reduce(array.first!, +)
        
        //then
        XCTAssertEqual(sumResult, 33173)
    }
    
    func test_removeFromArrayWithGivenElement() {
        //given
        var array = ["Cachorro", "Gato", "Cavalo", "Lebre"]
        
        //when
        array.remove("Gato")
        
        //then
        XCTAssertEqual(array, ["Cachorro", "Cavalo", "Lebre"])
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
        
        }
    }

}
