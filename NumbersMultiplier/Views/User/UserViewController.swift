//
//  UserViewController.swift
//  NumbersMultiplier
//
//  Created by Vinícius D. Brandão on 12/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var cepTextField: UITextField!
    @IBOutlet private weak var continueButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        cepTextField.delegate = self
        continueButton.isEnabled = false
        nameTextField.becomeFirstResponder()
        ThirdExercise().execute()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            cepTextField.becomeFirstResponder()
        } else if textField == cepTextField {
            didTouchContinueButton(self)
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let name = nameTextField.text, !name.isEmpty,
            let cep = cepTextField.text, !cep.isEmpty {
            continueButton.isEnabled = true
        }
    }
    
    @IBAction private func didTouchContinueButton(_ sender: Any) {
        if let name = nameTextField.text, !name.isEmpty,
            let zipCode = cepTextField.text, !zipCode.isEmpty {
            let vc = viewController(withStoryboarName: "Main", "CartViewController") as! CartViewController
            vc.viewModel = CartViewModel(user: UserModel(name: name, zipCode: zipCode))
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
}
