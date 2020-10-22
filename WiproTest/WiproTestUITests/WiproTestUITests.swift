//
//  WiproTestUITests.swift
//  WiproTestUITests
//
//  Created by Gyanendra Pathak on 22/10/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import XCTest

class WiproTestUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testTableViewAndCell() {
        app.launch()

        // Assert that we are displaying the tableview
        let picTableView = app.tables[Constant.kTableViewAccessId]
        
        XCTAssertTrue(picTableView.exists, Constant.kTableViewExist)
        
        // Get an array of cells
        let tableCells = picTableView.cells
        if tableCells.count > 0 {
            let count: Int = (tableCells.count - 1)
            
            let promise = expectation(description: Constant.kWaitForCell)
            
            for i in stride(from: 0, to: count , by: 1) {
                // Grab the first cell and verify that it exists
                let tableCell = tableCells.element(boundBy: i)
                XCTAssertTrue(tableCell.exists, "\(i) \(Constant.kCellPositionOnTable)")
                
                if i == (count - 1) {
                    promise.fulfill()
                }
            }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, Constant.kFinishedValidatingCell)
            
        } else {
            XCTAssert(false, Constant.kUnableToFindCell)
        }
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
