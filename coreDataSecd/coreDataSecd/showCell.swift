//
//  showCell.swift
//  coreDataSecd
//
//  Created by 屠秋霜 on 2018/3/30.
//  Copyright © 2018年 shuang. All rights reserved.
//

import UIKit

class showCell: UITableViewCell {

   @IBOutlet weak var nameLabel: UILabel!
   @IBOutlet weak var phoneLabel: UILabel!
   @IBOutlet weak var img: UIImageView!
   override func awakeFromNib() {
        super.awakeFromNib()
      self.img.layer.masksToBounds = true
      self.img.layer.cornerRadius  = 35.0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
