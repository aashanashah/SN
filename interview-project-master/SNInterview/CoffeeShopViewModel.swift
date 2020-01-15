//
//  CoffeeShopViewModel.swift
//  SNInterview
//
//  Created by Aashana Shah on 1/15/20.
//  Copyright © 2020 ServiceNow. All rights reserved.
//

import Foundation
import UIKit

struct CoffeeShop {
    let name: String
    let review: String
    let rating: Int
}

protocol CoffeeShopTapDelegate {
    func didSelectItem(_ item: UIView?)
}

class CoffeeShopViewModel: NSObject {
    var reviews: [CoffeeShop]!
    
    override init() {
        super.init()
        reviews = fetchReviews()
    }
    
    func fetchReviews() -> [CoffeeShop] {
        var fetchedReviews = [CoffeeShop]()
        return fetchedReviews
    }
}
