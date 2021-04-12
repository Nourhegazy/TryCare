//
//  BaseViewController.swift
//  Iraq
//
//  Created by Nour Hegazy on 1/6/20.
//  Copyright © 2020 UPS Apple. All rights reserved.
//

import UIKit
import  RxCocoa
import  RxSwift


class BaseViewController <VM: BaseViewModel>: UIViewController {

    var disposeBag = DisposeBag()
        
    var viewModel: VM! {
        didSet {

            viewModel.message.asSignal().emit(onNext: { messageEvent in
                SwiftMessagesUtils.showMessage(body: messageEvent.0, theme: messageEvent.1)
            }).disposed(by: disposeBag)
            
            viewModel.liteMessage.asSignal().emit(onNext: { messageLiteEvent in
                SwiftMessagesUtils.showMessage(body: messageLiteEvent.message, theme: messageLiteEvent.messageTheme, isLiteMessage: true)
            }).disposed(by: disposeBag)
            
            viewModel.isLoadingRequestRelay.asSignal().emit(onNext: { indicatorIsAnimating in

                indicatorIsAnimating ? ProgressOverlayManager.sharedInstance.showProgressIndecator(): ProgressOverlayManager.sharedInstance.hideProgressIndicator()

            }).disposed(by: disposeBag)
        }
    }
    
    
}
