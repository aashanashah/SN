//
//  CoffeeShopItemTableViewCell.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

// UIView -> UITableViewCell, so it can be directly registered for tableView
class CoffeeShopItemTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func configureCell(with dataModel: CoffeeShop) {
        nameLabel.text = dataModel.name
        reviewLabel.text = dataModel.review
        ratingLabel.text = "Rating: \(dataModel.rating)"
    }
}
