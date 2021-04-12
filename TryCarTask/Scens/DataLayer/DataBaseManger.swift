//
//  DataBaseManger.swift
//  TryCarTask
//
//  Created by UPS Apple on 10/04/2021.
//

import Foundation
import Realm
import RealmSwift


public final class DatabaseManger {
    
    private let realm: Realm
    private let postsPrimarykey = 100
    private let commentsPrimarykey = 200
    public convenience init() throws {
        
        try self.init(realm: Realm())
        
    }
    
    internal init(realm: Realm) {
        
        self.realm = realm
    }
//------  Posts ----
    func addOrUpdateAllPosts ( arr : [Post]) {
        let  posts = PostsList()
        posts.id = postsPrimarykey
        
        
        for i in arr {
            let post = PostObject(userID: i.userID!, id: i.id!, title: i.title!
                                  , body: i.body!)
            posts.listPosts.append(post)
        }
       
        try! realm.write{
            realm.add(posts, update: .modified)
        }
        
        print("Realm is Emprty .... \(realm.isEmpty) \(posts.listPosts.count) ")
    }
    
    func fetchAllPosts () -> [Post]?   {
        let posts = realm.object(ofType: PostsList.self, forPrimaryKey: postsPrimarykey)
        var postArr = [Post]()
        if  let arr = (posts?.listPosts) {
            for i in arr {
                let post = Post(userID: i.userID, id: i.id, title: i.title, body: i.body)
                postArr.append(post)
            }
            
            return postArr
        } else {
            return nil
        }
       
    }
// - Comments
    
    func addOrUpdateAllComments (postID : Int , arr : [Comment]) {
      
        let  comments = CommentList()
         comments.id = postID

      
        for  i in arr {
            let comment = CommentObject(postID: i.postID!, id: i.id!, title: i.name!
                                         , body: i.body! , email: i.email!)

            comments.listComments.append(comment)

        }
       
        try! realm.write{
            realm.add(comments, update: .modified)
            print(comments)
        }
        
        print("Realm is Emprty .... \(realm.isEmpty) \(comments.listComments.count) ")
    }
    
    func fetchAllComments (id : Int) -> [Comment]?
    {
        let comments = realm.object(ofType: CommentList.self, forPrimaryKey: id)
        let filterdArr = comments?.listComments
        var commentsArr = [Comment]()
        if  let arr = (filterdArr) {
            for i in arr {
                let comment = Comment(postID: i.postID, id: i.id, name: i.title, email: i.email, body: i.body)
                commentsArr.append(comment)
            }
            
            return commentsArr.filter { cc in
                cc.postID == id
            }
        } else {
            return nil
        }
       
    }
    
    //----- Favo
    
    
    
    func addOrUpdateFav (comment : Comment) {
      
        var  comObj = CommentObject()
        let  comment =    CommentObject(postID: comment.postID!, id: comment.id!, title: comment.name!, body: comment.email!, email: comment.body!)
        comObj = comment
        try! realm.write{
            realm.add(comObj , update: .modified)
            SwiftMessagesUtils.showMessage(body: "Saved", theme: .success, presentationStyle: .top, isLiteMessage: true)
        }
        
        print("Realm is Emprty .... \(realm.isEmpty) \(comment) ")
    }
    
    
    func fetchAllVaFav () -> [Comment]?   {
        let favors = realm.objects(CommentObject.self)
        var commentArr = [Comment]()
        if favors.count != 0 {
            for i in favors {
                let com = Comment(postID: i.postID, id: i.id, name: i.title, email: i.email, body: i.body)
                commentArr.append(com)
            }
            return commentArr
        }else {
            return nil
        }
            
            
           
        
       
    }
    
    
    
    func DeletAll(){
        try?  FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
        print(">>> DataBaseDeleted")
    }

}
