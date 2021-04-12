//
//  PostObject.swift
//  TryCarTask
//
//  Created by UPS Apple on 10/04/2021.
//

import Foundation
import RealmSwift
import RxRealm
import Realm

//struct Poste: Codable {
//    let userID, id: Int?
//    let title, body: String?
//
//    enum CodingKeys: String, CodingKey {
//        case userID = "userId"
//        case id, title, body
//    }
//   
//}

class PostsList : Object , Decodable {
     var listPosts  = List<PostObject>()
    @objc dynamic var   id = 0
    

    override  static func primaryKey() -> String? {
        return  "id"
        }
}




typealias PostsObject = List<PostObject>





class PostObject : Object,Decodable  {
    @objc dynamic var userID = 0
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var body = ""
    
override  static func primaryKey() -> String? {
        return "userID"
    }
    
    enum CodingKeys: String, CodingKey {
        case userID
        case id
        case title
        case body
       
    }

    convenience init(userID :Int , id:Int , title:String, body : String) {
        self.init()
        self.userID = userID
        self.id = id
        self.title = title
        self.body = body

    }

}



