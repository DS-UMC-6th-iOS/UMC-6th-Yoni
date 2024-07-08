//
//  MainViewController.swift
//  SocialLogin
//
//  Created by 선가연 on 7/9/24.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var nicknameLabel: UILabel!
    
    var nickname: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 닉네임 설정
        if let nickname = nickname {
            nicknameLabel.text = nickname
        }

    }

}
