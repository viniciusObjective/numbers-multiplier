//
//  ShippingService.swift
//  NumbersMultiplier
//
//  Created by Vinícius D. Brandão on 13/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import Foundation

protocol ShippingFeeDelegate: AnyObject {
    func calculateShippingFee(finalPrice: Double, zipCode: String) -> (finalPrice: Double, shippingFee: Double)?
}

class ShippingServices {
    typealias ShippingCompletion = (_ finalPrice: Double, _ finalPriceWithShipping: Double, _ shippingSituation: String) -> Void
    
    private weak var delegate: ShippingFeeDelegate?
    
    required init(delegate: ShippingFeeDelegate) {
        self.delegate = delegate
    }
    
    func calculateFinalPrice(cartItems: [ProductModel], zipCode: String, completion: @escaping ShippingCompletion) {
        let prices = cartItems.compactMap({ item in item.price })
        let finalPrice = prices.reduce(0, +)
        
        if finalPrice >= 100.00 {
            if let calculatedShip = delegate?.calculateShippingFee(finalPrice: finalPrice, zipCode: zipCode) {
                completion(calculatedShip.finalPrice, finalPrice, String(format: "The shipping price is: R$ %.02f", calculatedShip.shippingFee))
            } else {
                completion(0.0, 0.0, "Ops! \n Something whent wrong!!!")
            }
        } else {
            completion(finalPrice, finalPrice, "Free Shipping")
        }
    }
}
