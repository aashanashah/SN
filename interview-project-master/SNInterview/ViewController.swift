//
//  ViewController.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var delegate: CoffeeShopTapDelegate!
    
    @IBOutlet private weak var tableView: UITableView!
    private let viewModel = CoffeeShopViewModel()
    private let coffeeShopCellIdentifier = "coffeeShopCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // registering nib to be used for tableview reusable cell
        tableView.register(UINib(nibName: "CoffeeShopItemTableViewCell", bundle: nil), forCellReuseIdentifier: coffeeShopCellIdentifier)
        delegate = CoffeeShopDetailsHandler()
    }
    
    @objc
    func onTap(item: UIView) {
        delegate.didSelectItem(nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5//viewModel.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // guard to protect crash incase cell not allocated properly
        guard let reviewCell = tableView.dequeueReusableCell(withIdentifier: coffeeShopCellIdentifier) as? CoffeeShopItemTableViewCell else {
            return UITableViewCell()
        }
        
        reviewCell.nameLabel.text = "test \(indexPath.row)"
        return reviewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

class CoffeeShopDetailsHandler: CoffeeShopTapDelegate {
    func didSelectItem(_ item: UIView?) {
//        let tapped = item as! CoffeeShopItemView
//        
//        // TODO: display the item's details
//        print("Item Tapped: \(tapped)")
    }
}
