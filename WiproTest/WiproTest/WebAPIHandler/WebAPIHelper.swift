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
    let apiURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

    private override init() {
    }
    /**********************------This is for Get request------**********************/
    
     func callWebAPIGetRequest(CallBack: @escaping (_ data: Data?, _ error : ApiError?)->Void){
        if Reachability.isConnectedToNetwork(){
            let apiURLMain:String! = apiURL.replacingOccurrences(of: " ", with: "%20")
            let finalUrl:URL! = URL(string: apiURLMain)
            var urlRequest = URLRequest(url:finalUrl)
            urlRequest.httpMethod = "GET"
            urlRequest.timeoutInterval = TimeInterval(60)

            task = URLSession.shared.dataTask(with: urlRequest) {
                (data: Data?, response: URLResponse?, error: Error?) in
                
                DispatchQueue.main.async {
                    guard error == nil else {
                        CallBack(nil,ApiError.ServerError(message: "Server is not responding."))
                        return
                    }
                    guard let _data = data
                        else {
                            CallBack(nil,ApiError.ServerError(message: "Server is not responding."))
                            return
                    }
                    CallBack(_data, nil)
                }
            }
            task!.resume()
        }
        else {
            DispatchQueue.main.async {
                CallBack(nil,ApiError.NoInternet(message: "No Internet Connection."))
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
