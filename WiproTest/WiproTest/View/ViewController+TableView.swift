//
//  ViewController+TableView.swift
//  WiproTest
//
//  Created by Gyanendra Pathak on 29/09/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

@available(iOS 13.0, *)
extension ViewController{
    /*************------This is alert popup with single buttons------*****************/
    func showAlertPopUpWithSingleButton(title:String, message:String, buttonTitle : String, completion : @escaping (_ buttonClicked: Bool)->Void){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let btnAction = UIAlertAction(title: buttonTitle, style: .default, handler: { (UIAlertAction)in
            completion(true)
        })
        alertController.addAction(btnAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func callApiResponseFailure(error : ApiError){
        
        switch error{
        case .NoInternet:
            self.showAlertPopUpWithSingleButton(title: Constant.kSorry, message: Constant.kNoInternet, buttonTitle: Constant.kOk, completion: { (btnclicked) in
            })
        case .ServerError(let message):
            self.showAlertPopUpWithSingleButton(title: Constant.kSorry, message: message, buttonTitle: Constant.kOk, completion: { (btnclicked) in
            })
        default:
            self.showAlertPopUpWithSingleButton(title: Constant.kSorry, message: Constant.kNoInternet, buttonTitle: Constant.kOk, completion: { (btnclicked) in
            })
        }
    }
    
     
    
    // MARK: - Table view data source and delegate
       func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPicPaging.count
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.kTableViewCell, for: indexPath) as! TableViewCell
           cell.selectionStyle = .none
        let noImage = UIImage(named: Constant.kNoImage)

        if let url : String = arrayPicPaging[indexPath.row].imageHref {
            let fileUrl : NSURL = NSURL(string: url as String)!
            print(fileUrl)
            cell.imageViewAuthor.sd_setImage(with: fileUrl as URL, placeholderImage: noImage, options: SDWebImageOptions(rawValue: 1), completed: nil)
        }
        else{
            cell.imageViewAuthor.image = noImage
        }
        
        if let title = arrayPicPaging[indexPath.row].title {
        cell.labelTitle.text = title
        }
        else{
            cell.labelTitle.text = Constant.kNoTitle
        }
        if let description = arrayPicPaging[indexPath.row].rowDescription {
            cell.labelDescription.text = description
        }else{
            cell.labelDescription.text = Constant.kNoDescription
        }
           return cell
       }
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.customPagination(indexPath: indexPath)
    }
    func customPagination(indexPath: IndexPath){
        if viewModel!.picArray.count > arrayPicPaging.count && indexPath.row == arrayPicPaging.count-1{
                pagingStartCount += 10
                pagingEndCount += 10
            if viewModel!.picArray.count == pagingEndCount || viewModel!.picArray.count > pagingEndCount{
                    for i in pagingStartCount..<pagingEndCount {
                        arrayPicPaging.append(viewModel!.picArray[i])
            }
                    tableViewPic.reloadData()
            }
                else{
                    for i in pagingStartCount..<viewModel!.picArray.count {
                        arrayPicPaging.append(viewModel!.picArray[i])
                    }
                    tableViewPic.reloadData()

                }
        }
    }
}
