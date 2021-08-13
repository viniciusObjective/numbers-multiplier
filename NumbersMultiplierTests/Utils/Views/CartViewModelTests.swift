//
//  CartViewModelTests.swift
//  NumbersMultiplierTests
//
//  Created by Vinícius D. Brandão on 13/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import XCTest
@testable import NumbersMultiplier

class CartViewModelTests: XCTestCase {
    
    var viewModel = CartViewModel(user: UserModel(name: "Teste", zipCode: "11111-111"))
    var cartItems = [ProductModel]()
    
    override func setUp() {
        cartItems = []
    }
    
    func test_cartIsEmpty() {
        //when
        let cart = viewModel.consultFinalPrice(cartItems: cartItems)
        
        //then
        XCTAssert(!cart.isEmpty)
        XCTAssertEqual(cart, "Your cart is empty!")
    }
    
    func test_addProductToCart() {
        //given
        cartItems = [ProductModel(name: "Item 192", price: 458.92)]
        
        //when
        let cart = viewModel.consultFinalPrice(cartItems: cartItems)
        
        //then
        XCTAssert(!cart.isEmpty)
        XCTAssertEqual(cart, "The total amount for this cart is: R$ 508.92.\n The final value is: R$ 458.92.\n The shipping price is: R$ 50.00")
    }
    
    func test_shippingServiceWithNoInfo() {
        //given
        viewModel = CartViewModel(user: UserModel(name: "", zipCode: ""))
        
        //when
        let shipingPrice = viewModel.calculateShippingFee(finalPrice: 1231.12, zipCode: viewModel.user.zipCode)
        
        //then
        XCTAssert(shipingPrice == nil)
    }
    
    func test_cartValueWithMultiplesItems_overOneHundred() {
        //given
        cartItems = Mock().items
        
        //when
        let finalPrice = viewModel.consultFinalPrice(cartItems: cartItems)
        let spectatedResult = "The total amount for this cart is: R$ 610.00.\n The final value is: R$ 550.00.\n The shipping price is: R$ 60.00"
        
        //then
        XCTAssert(!finalPrice.isEmpty)
        XCTAssertEqual(finalPrice, spectatedResult)
    }
    
    func test_cartValueWithMultiplesItems_underOneHundred() {
        cartItems = [ProductModel(name: "Product 2", price: 20),
                     ProductModel(name: "Product 3", price: 30),
                     ProductModel(name: "Product 4", price: 40)]
        
        let finalPrice = viewModel.consultFinalPrice(cartItems: cartItems)
        
        let spectatedResult = "The total amount for this cart is: R$ 90.00.\n The final value is: R$ 90.00.\n Free Shipping"
        
        XCTAssertEqual(finalPrice, spectatedResult)
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
