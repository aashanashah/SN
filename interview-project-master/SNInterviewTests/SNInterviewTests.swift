//
//  SNInterviewTests.swift
//  SNInterviewTests
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import XCTest
@testable import SNInterview

class SNInterviewTests: XCTestCase {

    let testViewModel =  CoffeeShopViewModel()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoffeeShop() {
        let coffeeShop = CoffeeShop(name: "Test Coffee", review: "Test Review", rating: 1)
        XCTAssertEqual(coffeeShop.name, "Test Coffee")
        XCTAssertEqual(coffeeShop.review, "Test Review")
        XCTAssertEqual(coffeeShop.rating, 1)
    }
    
    func testLoadFromJSON() {
        let reviews = testViewModel.fetchReviews()
        XCTAssertTrue(reviews.count == 5)
        XCTAssertTrue(reviews.first?.name == "Lofty")
        XCTAssertTrue(reviews.first?.rating == 4)
    }
    
    func testMapingFromDict() {
        let mappedData = testViewModel.mapToCoffeeShop(from: ["name": "hello", "review": "world", "rating": 3])
        XCTAssertTrue(mappedData.name == "hello")
        XCTAssertTrue(mappedData.review == "world")
        XCTAssertTrue(mappedData.rating == 3)
    }
}
