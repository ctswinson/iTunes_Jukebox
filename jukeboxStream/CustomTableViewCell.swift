//
//  CustomTableViewCell.swift
//  jukeboxStream
//
//  Created by Chris Swinson on 10/30/17.
//  Copyright © 2017 Chris Swinson. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var songName: UILabel!
    @IBOutlet var singerName: UILabel!
    @IBOutlet var albumCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
