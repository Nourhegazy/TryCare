//
//  Moya-SSL-Pinning.swift
//  Iraq
//
//  Created by Mina Mageed on 12/13/20.
//  Copyright © 2020 UPSKWT. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum MoyaSSLPinning {
    static func session() -> Session {
        let pathToCert = Bundle.main.path(forResource: "star.qi.iq", ofType: "cer")
        let localCertificate : NSData = NSData(contentsOfFile: pathToCert!)!
        
        let certificates = [SecCertificateCreateWithData(kCFAllocatorDefault, localCertificate)!]
        
        let evaluator = PinnedCertificatesTrustEvaluator(certificates: certificates, acceptSelfSignedCertificates: true, performDefaultValidation: true, validateHost: true)
        let manager = ServerTrustManager(allHostsMustBeEvaluated: false, evaluators: [AppSettings.shared().settings().apiBaseURL: evaluator])
        return Session(serverTrustManager: manager)
    }
}
