//
//  PostsTableViewCell.swift
//  TryCarTask
//
//  Created by UPS Apple on 08/04/2021.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblBody : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell (model : Post? ) {
        guard let model = model else {return}
        self.lblTitle.text = model.title ?? ""
        self.lblBody.text = model.body ?? ""
    
    }
    
    
}
