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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        delegate = CoffeeShopDetailsHandler()
    }
    
    @objc
    func onTap(item: UIView) {
        delegate.didSelectItem(nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

class CoffeeShopDetailsHandler: CoffeeShopTapDelegate {
    func didSelectItem(_ item: UIView?) {
        let tapped = item as! CoffeeShopItemView
        
        // TODO: display the item's details
        print("Item Tapped: \(tapped)")
    }
}
