//
//  PostCollectionViewCell.swift
//  Catstagram
//
//  Created by 선가연 on 6/28/24.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData() {
        // 이미지 뷰의 이미지를 업로드
    }

}
