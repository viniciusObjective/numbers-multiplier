//
//  CartViewController.swift
//  NumbersMultiplier
//
//  Created by Vinícius D. Brandão on 13/08/21.
//  Copyright © 2021 Vinícius D. Brandão. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!

    private let data = Mock()
    private var selectedItems: [ProductModel] = []
    var viewModel: CartViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func didTouchFinishButton(_ sender: UIButton) {
        guard let viewModel = viewModel else { return }
        if selectedItems.count > 0  {
            let alertVC = UIAlertController(
                title: "",
                message: viewModel.consultFinalPrice(cartItems: selectedItems),
                preferredStyle: .alert)
            alertVC.addAction(.init(title: "OK", style: .destructive))
            
            present(alertVC, animated: true) { [weak self] in
                guard let self = self else { return }
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Default Cell")
        let index = data.items[indexPath.row]
        
        cell.textLabel?.text = index.name
        cell.detailTextLabel?.text = String(format: "R$ %.02f", index.price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItems.append(data.items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedItems.remove(data.items[indexPath.row])
    }
}
