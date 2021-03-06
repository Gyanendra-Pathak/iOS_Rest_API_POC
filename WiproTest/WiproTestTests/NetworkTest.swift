//
//  NetworkTest.swift
//  WiproTestTests
//
//  Created by Gyanendra Pathak on 21/10/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import XCTest

class NetworkTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testForNoInternetConnection(){
        let status = Reachability.isConnectedToNetwork()
        if !status{
            XCTAssert(true, Constant.kInternetUnavailable)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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

}
