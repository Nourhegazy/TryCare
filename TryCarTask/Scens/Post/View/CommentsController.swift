//
//  Comments.swift
//  TryCarTask
//
//  Created by UPS Apple on 10/04/2021.
//

import UIKit
import RxSwift
import RxCocoa
import Moya

class CommentsController: BaseViewController<CommentsViewModel> {

    @IBOutlet weak var tvComments: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBinding()
        self.viewModel.getAllComments()
        
    }
    

    func setupTableView() {
        tvComments.estimatedRowHeight = 44.0
        tvComments.rowHeight = UITableView.automaticDimension
        tvComments.tableFooterView = UIView()
        tvComments.register(UINib(nibName: "CommentsTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentsTableViewCell")
    }
    
    func setupBinding() {
        self.viewModel.reloadTableView.asSignal().emit(onNext: { (arg0) in
            self.tvComments.reloadData()
    
        }, onCompleted: {
            
        })

    }

}

extension CommentsController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.viewModel.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvComments.dequeueReusableCell(withIdentifier: "CommentsTableViewCell") as! CommentsTableViewCell
        let index = self.viewModel.comments?[indexPath.row]
        cell.configCell(model: index)
        cell.tapAction = { (celll) in
        //     Do Some Thing
            self.viewModel.addToFav(comment: index!)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    
    
}
