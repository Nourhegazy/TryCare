//
//  NetworkReachabilityManger.swift
//  Iraq
//
//  Created by Nour hegazy on 1/8/20.
//  Copyright © 2020 UPS Apple. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class NetworkReachabilityManger {
    
    var isNetworkReachable = BehaviorRelay<Bool>(value: true)
    
    let net = NetworkReachabilityManager()
    private let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    static let sharedInstance: NetworkReachabilityManger = { return NetworkReachabilityManger() }()
    
    private init() {
        startNetworkReachabilityObserver()
    }
    
   private func startNetworkReachabilityObserver() {
    
        reachabilityManager?.startListening  { status in
            switch status {
            case .notReachable, .unknown:
                self.isNetworkReachable.accept(false)
          
                SwiftMessagesUtils.showMessage(body: NSLocalizedString("Please check your internet connection and try again", comment:""), theme: .error, presentationStyle: .center, isLiteMessage: false)
            case .reachable(.ethernetOrWiFi):
                self.isNetworkReachable.accept(true)
                SwiftMessagesUtils.showMessage(body: "Come BACK", theme: .success, presentationStyle: .top, isLiteMessage: true)
            
                

            case .reachable(.cellular):
                print("  -*-*-*-* ")
            }
        }
 
    }
}




