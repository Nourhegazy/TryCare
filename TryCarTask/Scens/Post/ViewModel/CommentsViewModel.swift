//
//  CommentsViewModel.swift
//  TryCarTask
//
//  Created by UPS Apple on 10/04/2021.
//



import Foundation
import Moya
import RxCocoa
import RxSwift
class CommentsViewModel: BaseViewModel {
    var comments :[Comment]?
    var reloadTableView =  PublishRelay<Bool>()
    let reachability = NetworkReachabilityManger.sharedInstance
    var postId : Int
    let dataBase = try? DatabaseManger()
    private let api : MoyaProvider<TryCarApi>
    init( api :MoyaProvider<TryCarApi>  , postId : Int) {
        self.api = api
        self.postId = postId
    }
    
    
    func getAllComments() {
     // getComments()
      // fetchAllCommentsFromDatabBase(postID: postId)
       // fetchAllCommentsFromDatabBase(postID: 1)

                if reachability.isNetworkReachable.value == true{
                    getComments()
                    print("Comments from Api ")
                } else {
                    fetchAllCommentsFromDatabBase(postID: postId)
                    print("Comments from Realm Database  ")
                }
    }
    
    
    func getComments() {
       
        self.isLoadingRequestRelay.accept(true)
        api.rx.request(.getComments(id: postId))

            .map(CommentResponseObject.self).subscribWithErrorHandling(onSuccess: { [weak self] myResponse in
            guard let self = self else {return}
            self.isLoadingRequestRelay.accept(false)
          
                let arr =  myResponse
                    self.comments = arr
                    print(myResponse)
                self.dataBase?.addOrUpdateAllComments( postID: self.postId, arr: arr)
                    self.reloadTableView.accept(true)
          
            
            }, onError: {  _ in
                self.isLoadingRequestRelay.accept(false)
        }, viewModel:self, errorMessageSize: .large).disposed(by: disposeBag)
    }
    
    
    
    func addToFav(comment : Comment) {
        self.dataBase?.addOrUpdateFav(comment: comment)
    }
    
    func fetchAllCommentsFromDatabBase(postID : Int){
        let comments =   dataBase?.fetchAllComments(id: postID)
        self.comments = comments
        self.reloadTableView.accept(true)
    }
    
 
}
