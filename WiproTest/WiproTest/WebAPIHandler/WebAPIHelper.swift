//
//  WebAPIHelper.swift
//  WiproTest
//
//  Created by Gyanendra Pathak on 01/10/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//



import UIKit

enum ApiError {
    case NoInternet(message: String)
    case HTTPError(statusCode: Int)
    case ServerError(message: String)
}
enum  ApiResponse {
    case Success
    case Failure
}

class WebAPIHelper: NSObject {
    var task: URLSessionTask?
    static let sharedInstance = WebAPIHelper()
    let apiURL = Constant.kServiceURL

    private override init() {
    }
    /**********************------This is for Get request------**********************/
    
     func callWebAPIGetRequest(CallBack: @escaping (_ data: Data?, _ error : ApiError?)->Void){
        if Reachability.isConnectedToNetwork(){
            let apiURLMain:String! = apiURL.replacingOccurrences(of: Constant.kSpace, with: Constant.kPercent20)
            let finalUrl:URL! = URL(string: apiURLMain)
            var urlRequest = URLRequest(url:finalUrl)
            urlRequest.httpMethod = Constant.kGet
            urlRequest.timeoutInterval = TimeInterval(Constant.kTimeOut)

            task = URLSession.shared.dataTask(with: urlRequest) {
                (data: Data?, response: URLResponse?, error: Error?) in
                
                DispatchQueue.main.async {
                    guard error == nil else {
                        CallBack(nil,ApiError.ServerError(message: error!.localizedDescription))
                        return
                    }
                    guard let _data = data
                        else {
                            CallBack(nil,ApiError.ServerError(message: Constant.kServerNotResponding))
                            return
                    }
                    CallBack(_data, nil)
                }
            }
            task!.resume()
        }
        else {
            DispatchQueue.main.async {
                CallBack(nil,ApiError.NoInternet(message: Constant.kNoInternet))
            }
        }
    }
  
   func cancelFetchResponse() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
