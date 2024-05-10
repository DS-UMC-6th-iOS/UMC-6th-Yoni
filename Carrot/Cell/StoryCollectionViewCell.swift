//
//  StoryCollectionViewCell.swift
//  Carrot
//
//  Created by 선가연 on 5/10/24.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var StoryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        StoryImageView.layer.cornerRadius = 10
        StoryImageView.clipsToBounds = true
        // Initialization code
    }

}
