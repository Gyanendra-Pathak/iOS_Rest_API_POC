//
//  MockApiFetch.swift
//  WiproTest
//
//  Created by Gyanendra Pathak on 01/10/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import Foundation

import Foundation

class MockApiFetch: CallServiceProtocol {
    var apiData: PicModel?
    func getApiResponse(_ completion: @escaping ((_ testType:Bool, _ status:Bool, _ message:String?, _ data:PicModel?, _ error:ApiError?) -> Void)){
        if let data = apiData {
            completion(true, true, Constant.kFetchedDataSuccessfully, data, nil)
        } else {
            completion(true, false, Constant.kDataDidNotFetch, nil, nil)
        }
    }
}
