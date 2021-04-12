//
//  ProgressOverlayManager.swift
//  Iraq
//
//  Created by Nour Hegazy  on 1/9/20.
//  Copyright © 2020 UPS Apple. All rights reserved.
//
import UIKit
import Foundation
import NVActivityIndicatorView

class ProgressOverlayManager : UIViewController,NVActivityIndicatorViewable  {
    
    static let sharedInstance = ProgressOverlayManager()
   
    
     func showProgressIndecator (_WithMessage  message : String? = nil){
        let size = CGSize(width: 60, height: 60)
        let indicatorType = NVActivityIndicatorType.ballSpinFadeLoader
        
        startAnimating(
            size ,
            message: message,
            messageFont: nil,
            type: indicatorType,
            color: UIColor.brown,
            padding: 3,
            displayTimeThreshold: 5,
            minimumDisplayTime: 3,
            backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1534407106) ,
            textColor: UIColor.black,
            fadeInAnimation:nil)
        
    }
     func hideProgressIndicator (){
        stopAnimating()
        removeFromParent()
    }
}
