//
//  MyFavouriteViewController.swift
//  TryCarTask
//
//  Created by UPS Apple on 10/04/2021.
//

import UIKit

class MyFavouriteViewController: BaseViewController<MyFavouriteViewModel> {
    @IBOutlet weak var tvComments: UITableView!
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBinding()
        self.viewModel.fetchAllFavouriteComments()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tvComments.addSubview(refreshControl)
        // Do any additional setup after loading the view.
    }
    @objc func refresh(_ sender: AnyObject) {
        self.viewModel.fetchAllFavouriteComments()
        refreshControl.endRefreshing()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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


extension MyFavouriteViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.viewModel.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvComments.dequeueReusableCell(withIdentifier: "CommentsTableViewCell") as! CommentsTableViewCell
        let index = self.viewModel.comments?[indexPath.row]
        cell.configCellFavorit(model: index)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    
    
}
