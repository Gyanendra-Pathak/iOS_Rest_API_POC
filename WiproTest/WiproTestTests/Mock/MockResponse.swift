//
//  MockResponse.swift
//  WiproTestTests
//
//  Created by Gyanendra Pathak on 02/10/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

@testable import WiproTest
import XCTest

class MockResponse {
    let apiFetch = ApiFetch()
    func getResponseData() -> Data {
        guard let data = self.readJson(forResource: "response") else {
            XCTAssert(false, "Can't get data from facts.json")
            return Data()
        }
        return data
    }

    func getResponse() -> PicModel {
        guard let data = self.readJson(forResource: "response") else {
            XCTAssert(false, "Can't get data from response.json")
            return PicModel(title: "test Title", rows: nil)
        }
        let responseResults = try? apiFetch.parseJsonData(data: data)
        if responseResults != nil {
            XCTAssert(false, "Expected failure when no data")
        }
        return responseResults!
    }

    func getPiclist() -> [PicDetail] {
        guard let list = getResponse().rows else {
            return [PicDetail(title: "title", rowDescription: "description", imageHref: "imageHref")]
        }
        return list
    }
    
    func readJson(forResource fileName: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing file: \(fileName).json")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            XCTFail("unable to read json")
            return nil
        }
    }
    
}

    
