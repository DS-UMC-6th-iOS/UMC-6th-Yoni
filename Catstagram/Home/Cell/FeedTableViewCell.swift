//
//  FeedTableViewCell.swift
//  Catstagram
//
//  Created by 선가연 on 5/3/24.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewFeed: UIImageView!
    @IBOutlet weak var buttonIsHeart: UIButton!
    @IBOutlet weak var buttonIsBookMark: UIButton!
    @IBOutlet weak var labelHowManyLike: UILabel!
    @IBOutlet weak var labelFeed: UILabel!
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    
    // 좋아요 버튼
    @IBAction func actionIsHeart(_ sender: Any) {
        if buttonIsHeart.isSelected {
            buttonIsHeart.isSelected = false
        }
        else {
            buttonIsHeart.isSelected = true
        }
    }
    
    // 북마크 버튼
    @IBAction func actionIsBookMark(_ sender: Any) {
        if buttonIsBookMark.isSelected {
            buttonIsBookMark.isSelected = false
        }
        else {
            buttonIsBookMark.isSelected = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 프로필 이미지 둥글게 만들기
        imageViewUserProfile.layer.cornerRadius = 12.5
        imageViewUserProfile.clipsToBounds = true
        
        imageViewMyProfile.layer.cornerRadius = 12.5
        imageViewMyProfile.clipsToBounds = true
        
        // 폰트
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let atrributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        atrributedStr.addAttribute(.font, value: fontSize, range: NSRange.init())
        labelFeed.attributedText = atrributedStr
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
