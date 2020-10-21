//
//  Constant.swift
//  WiproTest
//
//  Created by Gyanendra Pathak on 20/10/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import Foundation

struct Constant{
    //Web Service
    static let kServiceURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    static let kPleaseWait = "Please Wait..."
    static let kOk = "Ok"
    static let kPullToRefresh = "Pull to refresh"
    static let kNoInternet = "No Internet Connection."
    static let kSorry = "Sorry"
    static let kNoData = "No data found"
    static let kFetchedDataSuccessfully = "Data fetched successfully!"
    static let kDataDidNotFetch = "Sorry data did not fetch."
    static let kServerNotResponding = "Server is not responding."
    static let kServerIssue = "There is some issue on server side."
    static let kSpace = " "
    static let kPercent20 = "%20"
    static let kGet = "GET"
    static let kTimeOut = 60
    //UI
    static let kNoImage = "NoImage"
    static let kNoTitle = "Title: NA"
    static let kNoDescription = "Description: NA"
    static let kTableViewCell = "TableViewCell"
    //Loader
    static let kFFFFFF = "FFFFFF"
    static let k444444 = "444444"
    //MockResponse
    static let kResponse = "response"
    static let kJSONIssue = "Can't get data from response.json"
    static let kTestTitle = "test Title"
    static let kExpectedFailureWhenNoData = "Expected failure when no data"
    static let kTitle = "title"
    static let kDescription = "description"
    static let kImageHref = "imageHref"
    static let kJson = "json"
    static let kMissingFile = "Missing file:"
    static let kUnableToReadJson = "unable to read json"
    //ModelTest
    static let kAboutCanada = "About Canada"
    static let kExpectedAboutCanadaBase = "Expected About Canada base"
    static let kRowCount = 14
    static let kExpectedRowCount = "Expected 14 row count"
    static let kExpectedValidPicModel = "Expected valid PicModel"
    static let kExpectedValidResponse = "Expected valid ResponseModel"
    //ViewModelTest
    static let kCanada = "Canada"
    static let kViewModel_NoData_Without_WebAPI = "ViewModel should not be able to fetch without Web API"
    static let kViewModel_NoDataFetch = "ViewModel should not be able to fetch"
    //WepApiTest
    static let kExpectedTaskNil = "Expected task nil"
    //NetworkTest
    static let kInternetUnavailable = "Internet is not accessible"
    //TableViewCell
    static let kBoldSytemFont = 20.0
    static let kSingleLine = 1
    static let kMultipleLine = 0
    static let kSytemFont = 16.0
    static let kFixPadding = 10.0
    static let kImageEqualHW = 128.0
    static let kLabelTitleHeight = 24.0

}
