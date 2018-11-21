//
//  TableTests.swift
//  TableTests
//
//  Created by Anshuman Dahale on 05/07/18.
//  Copyright © 2018 Anshuman Dahale. All rights reserved.
//

import XCTest
@testable import Table

class TableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //Mark: Core Data Test
    
    func testSaveInCoreData () {
        
        let dataManager = DataManager()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        let rickey = Player(firstName: "Rickey", lastName: "Pointing", date: formatter.date(from: "01/12/2018")!, matches: 100)
        let (result, error) = dataManager.save(player: rickey)
        
        if(result != true) {
            print(error)
        }
        else {
            print("Saved entity successfully")
        }
    }
    
    func testFetchFromCoreData() {
        
        let dataManager = DataManager()
        
        let (players, error) = dataManager.getPlayers()
        
        if(error == "") {
            print(players)
        }
    }
}
