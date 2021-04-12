//
//  CommentsObject.swift
//  TryCarTask
//
//  Created by UPS Apple on 11/04/2021.
//

import Foundation
import Realm
import RealmSwift



typealias CommentsObject = List<CommentList>


class CommentList : Object,Decodable  {
     var listComments = List<CommentObject>()
     @objc dynamic var   id = 0
    

    override  static func primaryKey() -> String? {
        return  "id"
        }
}



class CommentObject : Object , Decodable  {
    @objc dynamic var postID = 0
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var body = ""
    @objc dynamic var email = ""
    
override  static func primaryKey() -> String? {
        return "postID"
    }
    
   

    convenience init(postID :Int , id:Int , title:String, body : String , email :String) {
        self.init()
        self.postID = postID
        self.id = id
        self.title = title
        self.body = body
        self.email = email

    }

}
