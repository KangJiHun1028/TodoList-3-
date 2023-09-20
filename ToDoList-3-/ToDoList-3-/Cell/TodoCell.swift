//
//  TodoCellTableViewCell.swift
//  ToDoList-3-
//
//  Created by t2023-m0053 on 2023/09/15.
//

import UIKit
import CoreData

class TodoCell: UITableViewCell {
    var title: UILabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
