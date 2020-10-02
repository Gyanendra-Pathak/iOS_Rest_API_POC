//
//  WepApiTest.swift
//  WiproTestTests
//
//  Created by Gyanendra Pathak on 02/10/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import XCTest

class WepApiTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCancelRequest() {
        let webApi = WebAPIHelper.sharedInstance
        webApi.callWebAPIGetRequest() { _,_  in
            }
            webApi.cancelFetchResponse()
            XCTAssertNil(webApi.task, "Expected task nil")
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
