//
//  Observable.swift
//  Iraq
//
//  Created by UPS Apple on 1/6/20.
//  Copyright © 2020 UPS Apple. All rights reserved.
//

import Foundation
import RxSwift
import Moya


extension ObservableType {
    
    func subscribWithErrorHandling(onSuccess: @escaping ((Self.E) -> Void), onError: ((Error) -> Void)? = nil, viewModel: BaseViewModel, errorMessageSize: MessageSize = .large) -> Disposable {
        return self.subscribe(onNext: { element in
            onSuccess(element)
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
