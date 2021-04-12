//
//  PostsViewModel.swift
//  TryCarTask
//
//  Created by UPS Apple on 08/04/2021.
//

import Foundation
import Moya
import RxCocoa
import RxSwift
import RealmSwift

class PostsViewModel: BaseViewModel {
    var posts :[Post]?
    let reachability = NetworkReachabilityManger.sharedInstance
    var reloadTableView =  PublishRelay<Bool>()
    let dataBase = try? DatabaseManger()
    private let api : MoyaProvider<TryCarApi>
    init( api :MoyaProvider<TryCarApi> ) {
        self.api = api
      //dataBase?.DeletAll()
    }
    
    

    
    func getAllPosts () {
//    // getPosts()
//     fetchAllPostsfromDataBase()
        
        if reachability.isNetworkReachable.value == true{
            getPosts()
            print("GetApi from Api ")
        } else {
            fetchAllPostsfromDataBase()
            print("GetApi from Realm Database  ")
        }
    }
    
    
    
    func getPosts() {
      
       
        self.isLoadingRequestRelay.accept(true)
        api.rx.request(.getPosts)

            .map(PostResponseObject.self).subscribWithErrorHandling(onSuccess: { [weak self] myResponse in
            guard let self = self else {return}
            self.isLoadingRequestRelay.accept(false)
                let arr =  myResponse
                    self.posts = arr
                print("Count From Api Posts \(arr.count)")
                self.dataBase?.addOrUpdateAllPosts(arr: arr)
                    print(myResponse)
                    self.reloadTableView.accept(true)
          
            
            }, onError: {  _ in
                self.isLoadingRequestRelay.accept(false)
        }, viewModel:self, errorMessageSize: .large).disposed(by: disposeBag)
    }
    
    func fetchAllPostsfromDataBase(){
        
        let posts = self.dataBase?.fetchAllPosts()
         self.posts = posts
        self.reloadTableView.accept(true)
        
    }
    
}
