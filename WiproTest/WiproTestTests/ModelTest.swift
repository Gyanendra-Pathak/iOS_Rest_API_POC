//
//  ModelTest.swift
//  WiproTestTests
//
//  Created by Gyanendra Pathak on 02/10/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import XCTest

class ModelTest: XCTestCase {
    var apiFetchObj:ApiFetch?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        apiFetchObj = ApiFetch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        apiFetchObj = nil
    }

    func testEmptyDataResult(){
        let data = Data()
        let model = try? apiFetchObj?.parseJsonData(data: data)
        if model != nil {
            XCTAssert(false, Constant.kExpectedFailureWhenNoData)
        }
    }
    
    func testParseFeedsResult() {
        let data = MockResponse().getResponseData()
        let modelResponse = try? apiFetchObj?.parseJsonData(data: data)
        if let model = modelResponse {
            XCTAssertEqual(model.title, Constant.kAboutCanada, Constant.kExpectedAboutCanadaBase)
            if let list = model.rows {
                XCTAssertEqual(list.count, Constant.kRowCount, Constant.kExpectedRowCount)

            } else {
                XCTAssert(false, Constant.kExpectedValidPicModel)
            }
        }
        else{
            XCTAssert(false, Constant.kExpectedValidResponse)
        }
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
