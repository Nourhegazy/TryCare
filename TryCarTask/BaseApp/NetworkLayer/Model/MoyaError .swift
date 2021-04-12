//
//  MoyaError .swift
//  Iraq
//
//  Created by Nour hegazy on 1/8/20.
//  Copyright © 2020 UPS Apple. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa
import Kingfisher

extension MoyaError {
    
    func handelMoyaError(error: Swift.Error) -> String {
        var errorMessage: String!
        
        let reachability = NetworkReachabilityManger.sharedInstance
        do {
            if let errorModel = try self.response?.map(ErrorResponse.self) {
                errorMessage = errorModel.status
                
            } else {
                if !reachability.isNetworkReachable.value {
                    errorMessage = "No Internet Connection "
                } else {
                    errorMessage = error.localizedDescription
                }
                
            }
            
        } catch let parseError {
            
            errorMessage = parseError.localizedDescription
        }
        return errorMessage
    }
    
}




extension PrimitiveSequenceType where Self.TraitType == RxSwift.SingleTrait {
    
    typealias SuccessClosure = ((Self.ElementType) -> Void)
    typealias ErrorClosure = ((Error) -> Void)?
    
    func subscribWithErrorHandling(onSuccess: @escaping SuccessClosure, onError: ErrorClosure = nil, viewModel: BaseViewModel, errorMessageSize: MessageSize = .large) -> Disposable {
        return self.subscribe(onSuccess: { element in
            onSuccess(element)
            print("------------------------")
            print(element)
            
        }, onError: { error in
            onError?(error)
            let errorMessage: String!
            if let errorResponse = error as? Moya.MoyaError {
                errorMessage = errorResponse.handelMoyaError(error: errorResponse)
                switch errorMessageSize {
                case .large:
                    viewModel.message.accept((errorMessage, .error))
                case .lite:
                    viewModel.liteMessage.accept((errorMessage, .error))
                }
            } else {
                errorMessage = error.localizedDescription
            }
        })
    }
    
}


