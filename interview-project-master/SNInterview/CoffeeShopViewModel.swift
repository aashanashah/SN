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

// if the data is being changed, added a delegate to notify to the viewcontroller that the data was updated
protocol CoffeeShopViewModelDelegate: class {
    func notifyDataChange()
}

class CoffeeShopViewModel: NSObject {
    // made weak to avoid retain cycles
    weak var delegate: CoffeeShopViewModelDelegate?
    
    // if reviews change, notify it
    var reviews = [CoffeeShop]() {
        didSet {
            delegate?.notifyDataChange()
        }
    }
    
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
                let jsonData = try JSONSerialization.jsonObject(with: fetchedData, options: [])
                if let arrayDict = jsonData as? [[String: Any]] {
                    for review in arrayDict {
                        fetchedReviews.append(mapToCoffeeShop(from: review))
                    }
                }
            } catch {
                print("error fetching data")
            }
        }
        
        delegate?.notifyDataChange()
        return fetchedReviews
    }
    
    func mapToCoffeeShop(from dict: [String:Any]) -> CoffeeShop {
        let name = dict["name"] as? String ?? ""
        let review = dict["review"] as? String ?? ""
        let rating = dict["rating"] as? Int ?? 0
        
        return CoffeeShop(name: name, review: review, rating: rating)
    }
}
