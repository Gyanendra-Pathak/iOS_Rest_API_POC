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
        guard let data = self.readJson(forResource: Constant.kResponse) else {
            XCTAssert(false, Constant.kJSONIssue)
            return Data()
        }
        return data
    }

    func getResponse() -> PicModel {
        guard let data = self.readJson(forResource: Constant.kResponse) else {
            XCTAssert(false, Constant.kJSONIssue)
            return PicModel(title: Constant.kTestTitle, rows: nil)
        }
        let responseResults = try? apiFetch.parseJsonData(data: data)
        if responseResults != nil {
            XCTAssert(false, Constant.kExpectedFailureWhenNoData)
        }
        return responseResults!
    }

    func getPiclist() -> [PicDetail] {
        guard let list = getResponse().rows else {
            return [PicDetail(title: Constant.kTitle, rowDescription: Constant.kDescription, imageHref: Constant.kImageHref)]
        }
        return list
    }
    
    func readJson(forResource fileName: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: Constant.kJson) else {
            XCTFail("\(Constant.kMissingFile) \(fileName).\(Constant.kJson)")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            XCTFail(Constant.kUnableToReadJson)
            return nil
        }
    }
    
}

    
