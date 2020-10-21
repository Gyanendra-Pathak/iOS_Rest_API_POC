//
//  ViewModel.swift
//  WiproTest
//
//  Created by Gyanendra Pathak on 29/09/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import Foundation


class ViewModel: NSObject {
var picArray = Array<PicDetail>()
    var titleResponse:String?
    private var service: CallServiceProtocol?

    init(withService service: CallServiceProtocol) {
        self.service = service
    }
    
    
func callGetWebAPIToGetPicList(getCallBack: @escaping (_ success: Bool,_ message : String?, _ error:ApiError?)->Void){
        self.service?.getApiResponse(){ (testType, status, message, model, error)  in
            if !testType {
            if status {
                self.titleResponse = model?.title
                self.picArray = (model?.rows!)!
                if (self.picArray.count > 0) {
                    getCallBack(true, Constant.kFetchedDataSuccessfully, error)
                }
                else {
                    getCallBack(false, Constant.kServerIssue, error)
                }
        }
            else{
                getCallBack(status, nil, error)
            }
        }
            else {
                self.service?.getApiResponse(){ (testType, status, message, model, error)  in
                    if !(model == nil) {
                        getCallBack(true, message, nil)
                    }
                    else{
                        getCallBack(false, message, nil)
                    }
                }
            }
    }
}
}
