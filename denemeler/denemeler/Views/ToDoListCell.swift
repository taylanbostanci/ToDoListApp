//
//  TableViewCell.swift
//  denemeler
//
//  Created by Taylan Bostanci on 3.07.2020.
//  Copyright © 2020 Taylan Bostanci. All rights reserved.
//

import UIKit

class  ToDoListCell: UITableViewCell {
    
    @IBOutlet weak var  titleLabel :UILabel!
    @IBOutlet weak var changeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func changeButtonTouch(_ sender: Any) {
      
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
