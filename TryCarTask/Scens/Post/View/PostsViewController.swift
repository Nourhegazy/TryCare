//
//  PostsViewController.swift
//  TryCarTask
//
//  Created by UPS Apple on 08/04/2021.
//

import UIKit
import RxSwift
import RxCocoa
import Moya
import Realm
import RealmSwift

class PostsViewController: BaseViewController<PostsViewModel> {
    let realm = try! Realm()
    @IBOutlet weak var tvPosts: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

        setupTableView()
        setupBinding()
        self.viewModel.getAllPosts()
        
        
        
    }
    

    func setupTableView() {
        tvPosts.estimatedRowHeight = 44.0
        tvPosts.rowHeight = UITableView.automaticDimension
        tvPosts.tableFooterView = UIView()
        tvPosts.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "PostsTableViewCell")
    }
    


 
    
    
    
    func setupBinding() {
        self.viewModel.reloadTableView.asSignal().emit(onNext: { (arg0) in
            self.tvPosts.reloadData()
    
        }, onCompleted: {
            
        })

    }

}


extension PostsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.viewModel.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvPosts.dequeueReusableCell(withIdentifier: "PostsTableViewCell") as! PostsTableViewCell
        let index = self.viewModel.posts?[indexPath.row]
        cell.configCell(model: index)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = self.viewModel.posts?[indexPath.row]
        if let id = index?.id {
            self.openCommentsScreen(id: id)
            print("PPPPPPost ID : \(id)")
        }
        
      
    }
    
    func openCommentsScreen (id: Int) {
        let commentsViewModel = CommentsViewModel(api: MoyaProvider<TryCarApi>(), postId: id)
        if let commentsVC = self.storyboard!.instantiateViewController(identifier: "CommentsController") as? CommentsController {
            commentsVC.viewModel = commentsViewModel
            self.navigationController?.pushViewController(commentsVC, animated: true)
        }
        
    }
    
    
}


