//
//  ErrorObj.swift
//  Iraq-UAT
//
//  Created by Mina Mageed on 9/30/20.
//  Copyright © 2020 UPSKWT. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let errorObj = try? newJSONDecoder().decode(ErrorObj.self, from: jsonData)

import Foundation

// MARK: - ErrorObj
struct ErrorObj : Codable {
    let success: Bool?
    let status: String?
    let code: String?
    let errorId: String?
    let visible: Bool?
}
