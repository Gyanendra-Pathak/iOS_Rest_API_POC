//
//  ViewController.swift
//  WiproTest
//
//  Created by Gyanendra Pathak on 29/09/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@available(iOS 13.0, *)
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
@IBOutlet weak var tableViewPic: UITableView!
var apiFetch = ApiFetch()
var viewModel:ViewModel?
    
var arrayPicPaging = Array<PicDetail>()
var pagingEndCount = 10
var pagingStartCount = 0
var rowHeight:CGFloat = 210.0
var refreshControl = UIRefreshControl()
var refreshFlag = false
    

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    viewModel = ViewModel(withService: apiFetch)
    refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
    refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    tableViewPic.addSubview(refreshControl)
    self.callGetWebAPIToGetPicList()
}

@objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
    refreshFlag = true
    viewModel!.picArray.removeAll()
    self.callGetWebAPIToGetPicList()
}
    
override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    if UIDevice.current.orientation.isLandscape == true {
        print("Landscape")
       rowHeight = 393.0
    } else {
        print("Portrait")
       rowHeight = 210.0
    }
}

// MARK: - WebAPI to get response of pic list
func callGetWebAPIToGetPicList() {
    Loader.showLoader(controller: self, loaderText: "Please Wait...", withIndicator: true)
    viewModel!.callGetWebAPIToGetPicList() { [unowned self] (success, message, error) in
        Loader.hideLoader(controller: self)
        if success {
            self.title = self.viewModel?.titleResponse
            if self.refreshFlag {
                self.arrayPicPaging.removeAll()
                self.refreshControl.endRefreshing()
                self.refreshFlag = false
                self.pagingEndCount = 10
                self.pagingStartCount = 0
            }
            //update table with data
            if self.viewModel!.picArray.count > 10{
                for i in self.pagingStartCount..<self.pagingEndCount {
                    self.arrayPicPaging.append(self.viewModel!.picArray[i])
            }
            }
            else{
                self.arrayPicPaging = self.viewModel!.picArray
            }
            self.tableViewPic.dataSource = self
            self.tableViewPic.delegate = self
            self.tableViewPic.reloadData()
        }
            
        else{
            self.title = ""
            if self.refreshFlag {
                self.refreshControl.endRefreshing()
                self.refreshFlag = false
                self.pagingEndCount = 10
                self.pagingStartCount = 0
            }
            if message != nil {
                self.showAlertPopUpWithSingleButton(title: self.title!, message: message!, buttonTitle: "Ok") { (status) in
                    if status{
                        print("Clicked Ok")
                    }
                }
            }
            else{
                self.callApiResponseFailure(error: error!)
            }
        }
    }
 }
}

