//
//  ItemTests.swift
//  EnterpriseBusinessRules
//
//  Created by Juan Pablo Lugo on 11/9/16.
//  Copyright © 2016 Nearshore Technology. All rights reserved.
//

import XCTest
@testable import EnterpriseBusinessRules

class ItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateItemInstance() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(Item(n: "Granola Bar", t: ItemType.Piece(quantity: 10)) != nil)
    }
    
    func testItemReturnStockLevel() {
        let item = Item(n: "My item", t: ItemType.Weight(grams: 200))
        XCTAssertTrue(item.calculateStockLevel() != nil)
    }
    
}

// MARK:- Pieces

extension ItemTests {
    
    func testReturnGreenStockLevelForPiecesGreatherThan10() {
        let item0 = Item(n: "my item", t: ItemType.Piece(quantity: 11))
        XCTAssertTrue(item0.calculateStockLevel() == StockLevel.Green)
    }
    
    func testReturnGreenStockLevelForPiecesEqualTo10() {
        let item0 = Item(n: "my item", t: ItemType.Piece(quantity: 10))
        XCTAssertTrue(item0.calculateStockLevel() == StockLevel.Green)
    }
    
    func testReturnYellowStockLevelForPiecesGreatherThan5() {
        let item0 = Item(n: "my item", t: ItemType.Piece(quantity: 6))
        XCTAssertTrue(item0.calculateStockLevel() == StockLevel.Yellow)
    }
    
    func testReturnYellowStockLevelForPiecesEqualTo5() {
        let item0 = Item(n: "my item", t: ItemType.Piece(quantity: 5))
        XCTAssertTrue(item0.calculateStockLevel() == StockLevel.Yellow)
    }
    
    func testReturnRedStockLevelForPiecesLesserThan5() {
        let item0 = Item(n: "my item", t: ItemType.Piece(quantity: 4))
        XCTAssertTrue(item0.calculateStockLevel() == StockLevel.Red)
    }
}

//MARK:- Weight

extension ItemTests {
  
    func testReturnGreenStockLevelForWeightGreatherThan500() {
        let item0 = Item(n: "my item", t: ItemType.Weight(grams: 501))
        XCTAssertTrue(item0.calculateStockLevel() == StockLevel.Green)
    }
    
    func testReturnGreenStockLevelForWeightEqualTo500() {
        let item0 = Item(n: "my item", t: ItemType.Weight(grams: 500))
        XCTAssertTrue(item0.calculateStockLevel() == StockLevel.Green)
    }
    
    func testReturnYellowStockLevelForWeightGreatherThan200() {
        let item0 = Item(n: "my item", t: ItemType.Weight(grams: 201))
        XCTAssertTrue(item0.calculateStockLevel() == StockLevel.Yellow)
    }
    
    func testReturnYellowStockLevelForWeightEqualTo200() {
        let item0 = Item(n: "my item", t: ItemType.Weight(grams: 200))
        XCTAssertTrue(item0.calculateStockLevel() == StockLevel.Yellow)
    }
    
    func testReturnRedStockLevelForWeightLesserThan200() {
        let item0 = Item(n: "my item", t: ItemType.Weight(grams: 199))
        XCTAssertTrue(item0.calculateStockLevel() == StockLevel.Red)
    }
    
    func testReturnRedStockLevelForWeightLesserThanZero() {
        let item0 = Item(n: "my item", t: ItemType.Weight(grams: -1))
        XCTAssertTrue(item0.calculateStockLevel() == StockLevel.Red)
    }
    
}

//MARK:- Setting and reading attributes

extension ItemTests {
    
    func testSettingAttributes() {
        let item = getItemInstanceWithSetAttributes()
        
        XCTAssertTrue(true)
    }
    
    func testReadingAttributes() {
        let item = getItemInstanceWithSetAttributes()
        print(item)
        
        XCTAssertTrue(item.description.characters.count > 0)
    }
    
    func testReadingWithMandatoryAttributes() {
        let item = Item(n: "my item", t: ItemType.Piece(quantity: 4));
        
        print(item)
        
        XCTAssertTrue(item.description.characters.count > 0)
    }
    
    func getItemInstanceWithSetAttributes() -> Item {
        var item = Item(n: "my item", t: ItemType.Piece(quantity: 4));
        item.price = 34.45
        item.details = "my details"
        item.photo = "myphoto"
        
        return item;
    }
}
