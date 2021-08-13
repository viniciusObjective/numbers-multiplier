//
//  CartViewModel.swift
//  NumbersMultiplier
//
//  Created by Vinícius D. Brandão on 13/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import Foundation

class CartViewModel: ShippingFeeDelegate {
    
    private var shippingService: ShippingServices { return ShippingServices(delegate: self) }
    private(set) var user: UserModel
    
    required init(user: UserModel) {
        self.user = user
    }
    
    
    func consultFinalPrice(cartItems: [ProductModel]) -> String {
        var finalPriceMessage = "Your cart is empty!"
        if cartItems.count > 0 {
            shippingService.calculateFinalPrice(cartItems: cartItems, zipCode: user.zipCode) { total, totalWithShipping, feeMessage in
                finalPriceMessage = String(format: "The total amount for this cart is: R$ %0.2f.\n The final value is: R$ %0.2F.\n \(feeMessage)", total, totalWithShipping)
            }
        }
        
        
        return finalPriceMessage
    }
    
    func calculateShippingFee(finalPrice: Double, zipCode: String) -> (finalPrice: Double, shippingFee: Double)? {
        guard !zipCode.isEmpty && finalPrice > 0 else { return nil}
        switch finalPrice {
        case 100.00..<200.00: return (finalPrice + 20.00, 20.00)
        case 200.01..<300.00: return (finalPrice + 30.00, 30.00)
        case 300.01..<400.00: return (finalPrice + 40.00, 40.00)
        case 400.01..<500.00: return (finalPrice + 50.00, 50.00)
        case 500.01...: return (finalPrice + 60.00, 60.00)
        default: return nil
        }
    }
}
