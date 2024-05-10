//
//  TableViewCell.swift
//  Carrot
//
//  Created by 선가연 on 5/3/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewItem: UIImageView!
    
    @IBOutlet weak var labelItemTitle: UILabel!
    
    @IBOutlet weak var labelItemPlaceAndDate: UILabel!
    
    @IBOutlet weak var labelItemPrice: UILabel!
    
    @IBOutlet weak var buttonIsHeart: UIButton!
    
    @IBOutlet weak var buttonIsMessage: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // imageView 모서리 둥글게
        imageViewItem.layer.cornerRadius = 10
        imageViewItem.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
