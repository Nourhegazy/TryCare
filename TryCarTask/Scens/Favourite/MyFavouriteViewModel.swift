//
//  MyFavouriteViewModel.swift
//  TryCarTask
//
//  Created by UPS Apple on 10/04/2021.
//

import Foundation
import RxCocoa
import RxSwift
class MyFavouriteViewModel : BaseViewModel {
    var comments :[Comment]?
    let dataBase = try? DatabaseManger()
    var reloadTableView =  PublishRelay<Bool>()
    
    
    func fetchAllFavouriteComments() {
        
        if let arrComments = dataBase?.fetchAllVaFav() {
            self.comments = arrComments
            self.reloadTableView.accept(true)
           
        }
        
        
    }
    
    
    
    
    
    
}
