//
//  BaseViewModel.swift
//  Iraq
//
//  Created by Nour Hegazy  on 1/6/20.
//  Copyright © 2020 UPS Apple. All rights reserved.
//

import RxSwift
import RxCocoa

class BaseViewModel {
    
    let disposeBag = DisposeBag()
    
    // used to show long message
    let message = PublishRelay<(String, MessageTheme)>()

    // used to show small message
    let liteMessage = PublishRelay<(message: String, messageTheme: MessageTheme)>()
    // indocator
    let isLoadingRequestRelay = PublishRelay<Bool> ()

}

// to send message size to swiftMessages
enum MessageSize {
    case lite
    case large
}
