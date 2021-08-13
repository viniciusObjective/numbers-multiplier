//
//  UIViewController.swift
//  NumbersMultiplier
//
//  Created by Vinícius D. Brandão on 13/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func viewController(withStoryboarName storyboarName: String, _ viewControllerName: String)  -> UIViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboarName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewControllerName)
    }
}
