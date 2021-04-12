//
//  PostRespose.swift
//  TryCarTask
//
//  Created by UPS Apple on 08/04/2021.
//

import Foundation



struct PostsResponse: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}


struct Post: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PostResponseObject = [Post]



//extension Array: Decodable where Element: Decodable {}
