//
//  Comment.swift
//  TryCarTask
//
//  Created by UPS Apple on 10/04/2021.
//

import Foundation
 // 
struct Comment: Codable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}


typealias CommentResponseObject = [Comment]


