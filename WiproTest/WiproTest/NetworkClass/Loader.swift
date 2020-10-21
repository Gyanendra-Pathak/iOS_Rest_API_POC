//
//  Loader.swift
//  WiproTest
//
//  Created by Gyanendra Pathak on 30/09/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//



import UIKit
import QuartzCore
import Foundation

@available(iOS 13.0, *)
public class Loader
{
  class func customActivityIndicatory(_ viewContainer: UIView, startAnimate:Bool? = true) -> UIActivityIndicatorView {
    
    let blackView: UIView = UIView(frame: viewContainer.frame)
    blackView.backgroundColor = .black
    blackView.alpha = 0.6
    blackView.tag = 789456120
    blackView.isUserInteractionEnabled = false
    
    let mainContainer: UIView = UIView(frame: viewContainer.frame)
    mainContainer.center = viewContainer.center
    mainContainer.backgroundColor = UIColor(hex: Constant.kFFFFFF)
    mainContainer.alpha = 0.5
    mainContainer.tag = 789456123
    mainContainer.isUserInteractionEnabled = false
    
    let viewBackgroundLoading: UIView = UIView(frame: CGRect(x:0,y: 0,width: 80,height: 80))
    viewBackgroundLoading.center = viewContainer.center
    viewBackgroundLoading.backgroundColor = UIColor(hex: Constant.k444444)
    viewBackgroundLoading.alpha = 0.5
    viewBackgroundLoading.clipsToBounds = true
    viewBackgroundLoading.layer.cornerRadius = 15
    
    let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
    activityIndicatorView.frame = CGRect(x:0.0,y: 0.0,width: 40.0, height: 40.0)
    activityIndicatorView.style =
        UIActivityIndicatorView.Style.large
    activityIndicatorView.center = CGPoint(x: viewBackgroundLoading.frame.size.width / 2, y: viewBackgroundLoading.frame.size.height / 2)
    if startAnimate!{
      viewBackgroundLoading.addSubview(activityIndicatorView)
      mainContainer.addSubview(viewBackgroundLoading)
      viewContainer.addSubview(mainContainer)
        viewContainer.bringSubviewToFront(mainContainer)
      
      activityIndicatorView.startAnimating()
    }else{
      for subview in viewContainer.subviews{
        if subview.tag == 789456123{
          subview.removeFromSuperview()
        }
      }
    }
    return activityIndicatorView
  }
  
  class func showLoader(controller :UIViewController, loaderText:String, withIndicator: Bool){
    
    var vwProgressPopup = UIView()
    var progressActivityIndicator = UIActivityIndicatorView()
    var lblMessage = UILabel()
    var blackView = UIView()
    blackView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: controller.view.frame.size.width, height: controller.view.frame.size.height))
    blackView.backgroundColor = .black
    blackView.alpha = 0.6
    blackView.tag = 1234
    lblMessage = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 50))
    lblMessage.text = loaderText
    lblMessage.textColor = UIColor.white
    vwProgressPopup = UIView(frame: CGRect(x: controller.view.frame.midX - 90, y: controller.view.frame.midY - 25 , width: 180, height: 50))
    vwProgressPopup.layer.cornerRadius = 15
    vwProgressPopup.backgroundColor = UIColor(white: 0, alpha: 0.7)
    vwProgressPopup.tag = 9999
    
    DispatchQueue.main.async { () -> Void in
      
      if (withIndicator) {
        progressActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        progressActivityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        progressActivityIndicator.startAnimating()
        vwProgressPopup.addSubview(progressActivityIndicator)
      }
      
      vwProgressPopup.addSubview(lblMessage)
      controller.view.addSubview(blackView)
      controller.view.addSubview(vwProgressPopup)
      
    }
    
  }
  
  class func hideLoader(controller : UIViewController) {
    DispatchQueue.main.async { () -> Void in
      controller.view.viewWithTag(1234)?.removeFromSuperview()
      controller.view.viewWithTag(9999)?.removeFromSuperview()
      
    }
    
  }
}
extension UIColor {
  convenience init(hex: String) {
    let scanner = Scanner(string: hex)
    scanner.scanLocation = 0
    
    var rgbValue: UInt64 = 0
    
    scanner.scanHexInt64(&rgbValue)
    
    let r = (rgbValue & 0xff0000) >> 16
    let g = (rgbValue & 0xff00) >> 8
    let b = rgbValue & 0xff
    
    self.init(
      red: CGFloat(r) / 0xff,
      green: CGFloat(g) / 0xff,
      blue: CGFloat(b) / 0xff, alpha: 1
    )
  }
}


