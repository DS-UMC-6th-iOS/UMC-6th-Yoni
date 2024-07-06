//
//  PostCollectionViewCell.swift
//  Catstagram
//
//  Created by 선가연 on 6/28/24.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData(_ imageURLStr: String?) {
        // 이미지 뷰의 이미지를 업로드
        guard let imageURLStr = imageURLStr else {return}
        if let url = URL(string: imageURLStr) {
            postImageView.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "photo"))
        }
    }

}
