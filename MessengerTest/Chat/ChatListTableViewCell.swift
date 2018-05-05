//
//  ChatListTableViewCell.swift
//  MessengerTest
//
//  Created by Ryan Aubrey on 5/5/18.
//  Copyright © 2018 Ryan Aubrey. All rights reserved.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chatItemTitle: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configureCell(_ title: String) {
        chatItemTitle.text = title
    }
    
    
}
