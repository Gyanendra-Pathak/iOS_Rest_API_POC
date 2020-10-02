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
                   // getCallBack(false, , error)
                    completion(false, false, "No data found", nil, error)
                    return
                }
                if
                    let response = String(data: data, encoding: String.Encoding.ascii),
                    let dataFinal = response.data(using: String.Encoding.utf8) {
                    let objModel =  try self.parseJsonData(data: dataFinal)
                    completion(false, true, "Data fetched successfully!", objModel, error)
                }
                else{
                    completion(false, false, "Sorry data did not fetched.", nil, error)
                }
            } catch let parsingError {
                print("Error", parsingError)
                completion(false, false, nil, nil, ApiError.ServerError(message: "Server is not responding."))
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
