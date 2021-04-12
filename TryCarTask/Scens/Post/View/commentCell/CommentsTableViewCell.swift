//
//  CommentsTableViewCell.swift
//  TryCarTask
//
//  Created by UPS Apple on 10/04/2021.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    @IBOutlet weak var btnFavourit: UIButton!
    
    var tapAction :(((UITableViewCell) -> Void))?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblBody : UILabel!
    
    
    @IBAction func btnFav(_ sender: Any) {
        tapAction?(self)
    }
    

    func configCell (model : Comment? ) {
        guard let model = model else {return}
        self.lblTitle.text = model.name ?? ""
        self.lblBody.text = model.body ?? ""
    
    }
    
    func configCellFavorit (model : Comment? ) {
        btnFavourit.isHidden  = true
        guard let model = model else {return}
        self.lblTitle.text = model.name ?? ""
        self.lblBody.text = model.body ?? ""
    
    }
    
}
