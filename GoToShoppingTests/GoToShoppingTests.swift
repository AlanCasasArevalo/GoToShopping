//
//  GoToShoppingTests.swift
//  GoToShoppingTests
//
//  Created by Alan Casas on 15/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import XCTest
@testable import GoToShopping

class GoToShoppingTests: XCTestCase {
    var shopy:Shop! = nil
    let shop = Shop(name: "Galerias")
    var shops = Shops()
    let downloadShopInteractor: DownloadAllShopsIteractorProtocol = DownloadAllShopsIteractorImplementationFake()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShopExistence (){
        XCTAssertNotNil(shop)
        
        XCTAssertNil(shopy)
    }
    
    func testAddNewShop(){
        XCTAssertEqual(shops.count(), 0)
        shops.addShop(shop: shop)
        XCTAssertEqual(shops.count(), 1)
    }
    
    func testGetIndexShop(){
        XCTAssertNil(shops.getShop(index: -1))
        XCTAssertNil(shops.getShop(index: 1))
        shops.addShop(shop: shop)
    }
    
    func testHashableShop(){
        shopy = Shop(name: "CorteFiel")
        XCTAssertNotNil(shopy.proxy.hashValue)
    }
    
    func testComparableShops(){
        shopy = Shop(name: "CorteFiel")
        XCTAssertTrue(shopy < shop)
    }
    
    func testEquatableShops(){
        let galerias = Shop(name: "Galerias")
        shopy = Shop(name: "CorteFiel")
        XCTAssertNotEqual(shopy, shop)
        XCTAssertEqual(shop, galerias)
    }
    
    func testDownloadFakeNotNil(){
        XCTAssertNotNil(downloadShopInteractor.execute { (shops: Shops) in})
    }
    
    func testDownloadFakeContainsSomething() {
        downloadShopInteractor.execute { (shops:Shops) in
            
            let shopsListFake = Shops()
            
            for i in 0 ..< 20 {
                let shopFake = Shop(name: "La tienda fake es: \( i )")
                shopsListFake.addShop(shop: shopFake)
                XCTAssertEqual(shops.count(), 10)
            }
        }
//        XCTAssertNotEqual(shops.count(), 10)
    }
    
}




























