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
        if let filePath = Bundle.main.path(forResource: "CoffeeShops", ofType: "json") {
            let url = URL(fileURLWithPath: filePath)
            do {
                let fetchedData = try Data(contentsOf: url, options: .mappedIfSafe)
                print(url)
                print(filePath)
                print("\(fetchedData)")
            } catch {
                print("error fetching data")
            }
        }
        
        return fetchedReviews
    }
}
