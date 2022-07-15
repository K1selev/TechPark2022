//
//  TableViewCell.swift
//  VK Service
//
//  Created by SergeyK on 14.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailTextDescriptionLabel: UILabel!
    
}
