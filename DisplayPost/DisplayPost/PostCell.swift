//
//  TableViewCell.swift
//  DisplayPost
//
//  Created by macOS15 on 14/12/25.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var userID: UILabel!
    
    @IBOutlet weak var usertitle: UILabel!
    
    @IBOutlet weak var bodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpView(post:Post) {
        
        userID.text = "\(post.userId)"
        usertitle.text="\(post.title)"
        bodyLbl.text="\(post.body)"
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
