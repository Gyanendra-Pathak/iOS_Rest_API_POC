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
let tableViewPic = UITableView()
var apiFetch = ApiFetch()
var viewModel:ViewModel?
    
var arrayPicPaging = Array<PicDetail>()
var pagingEndCount = 10
var pagingStartCount = 0
var refreshControl = UIRefreshControl()
var refreshFlag = false
    

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .white
    viewModel = ViewModel(withService: apiFetch)
    
    tableViewPic.accessibilityIdentifier = Constant.kTableViewAccessId
    tableViewPic.rowHeight = UITableView.automaticDimension
    tableViewPic.register(TableViewCell.self, forCellReuseIdentifier: Constant.kTableViewCell)
    view.addSubview(tableViewPic)
    
    tableViewPic.translatesAutoresizingMaskIntoConstraints = false
            
    tableViewPic.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
    tableViewPic.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
    tableViewPic.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
    tableViewPic.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            
    refreshControl.attributedTitle = NSAttributedString(string: Constant.kPullToRefresh)
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

// MARK: - WebAPI to get response of pic list
func callGetWebAPIToGetPicList() {
    Loader.showLoader(controller: self, loaderText: Constant.kPleaseWait, withIndicator: true)
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
                self.arrayPicPaging.removeAll()
                self.viewModel?.picArray.removeAll()
                self.tableViewPic.dataSource = self
                self.tableViewPic.delegate = self
                self.tableViewPic.reloadData()
            }
            if message != nil {
                self.showAlertPopUpWithSingleButton(title: self.title!, message: message!, buttonTitle: Constant.kOk) { (status) in
                    if status{
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

