//
//  MainTableViewCell.swift
//  InstagramClone
//
//  Created by Barış Aydemir on 20.09.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var ppImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    
    @IBOutlet weak var commentPp: UIImageView!
    
    @IBOutlet weak var commentAddText: UITextField!
    
    @IBOutlet weak var whenTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
