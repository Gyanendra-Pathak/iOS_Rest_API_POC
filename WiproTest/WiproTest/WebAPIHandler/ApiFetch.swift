//
//  ApiFetch.swift
//  WiproTest
//
//  Created by Gyanendra Pathak on 01/10/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import Foundation

class ApiFetch: CallServiceProtocol {
    
    func getApiResponse(_ completion: @escaping ((_ testType:Bool, _ status:Bool, _ message:String?, _ data:PicModel?, _ error:ApiError?) -> Void)){
        WebAPIHelper.sharedInstance.callWebAPIGetRequest() { (data, error)  in
        if error == nil {
            do {
                guard let data = data else {
                    completion(false, false, Constant.kNoData, nil, error)
                    return
                }
                if
                    let response = String(data: data, encoding: String.Encoding.ascii),
                    let dataFinal = response.data(using: String.Encoding.utf8) {
                    let objModel =  try self.parseJsonData(data: dataFinal)
                    completion(false, true, Constant.kFetchedDataSuccessfully, objModel, error)
                }
                else{
                    completion(false, false, Constant.kDataDidNotFetch, nil, error)
                }
            } catch{
                completion(false, false, nil, nil, ApiError.ServerError(message: Constant.kServerNotResponding))
            }
        }
        else{
            completion(false, false, nil, nil, error)
        }
    }
}
    func parseJsonData(data:Data?) throws -> PicModel {
        let decoder = JSONDecoder()
        let objModel =  try decoder.decode(PicModel.self, from: data!)
        return objModel
    }
}
