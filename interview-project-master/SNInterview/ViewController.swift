//
//  ViewController.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel = CoffeeShopViewModel()
    private let coffeeShopCellIdentifier = "coffeeShopCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.delegate = self
        
        // registering nib to be used for tableview reusable cell
        tableView.register(UINib(nibName: "CoffeeShopItemTableViewCell", bundle: nil), forCellReuseIdentifier: coffeeShopCellIdentifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // guard to protect crash incase cell not allocated properly
        guard let reviewCell = tableView.dequeueReusableCell(withIdentifier: coffeeShopCellIdentifier) as? CoffeeShopItemTableViewCell else {
            return UITableViewCell()
        }
        
        reviewCell.configureCell(with: viewModel.reviews[indexPath.row])
        
        return reviewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Item tapped: \(viewModel.reviews[indexPath.row])")
    }
}

extension ViewController: CoffeeShopViewModelDelegate {
    func notifyDataChange() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
