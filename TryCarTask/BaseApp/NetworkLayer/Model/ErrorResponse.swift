//
//  ErrorResponse.swift
//  Iraq
//
//  Created by Nour Hegazy on 1/8/20.
//  Copyright © 2020 UPS Apple. All rights reserved.
//

import Foundation


struct ErrorResponse {
    var success: Bool?
    var status: String? // name of error
   

    enum CodingKeys: String, CodingKey {
        case status
        case success
    }
}

extension ErrorResponse: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decode(Bool.self, forKey: .success)
        status = try values.decode(String.self, forKey: .status)
     
    }
    
}

extension ErrorResponse: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(success, forKey: .success)
    }
}
