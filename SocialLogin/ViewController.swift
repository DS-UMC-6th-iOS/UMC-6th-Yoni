//
//  ViewController.swift
//  SocialLogin
//
//  Created by 선가연 on 7/8/24.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginWithEmailBtn: UIButton!
    
    // 카카오 로그인
    @IBAction func LoginWithKakaoDidTap(_ sender: UIButton) {
        // 카카오톡 앱으로 로그인
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk{(OAuthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    // 사용자 정보 요청
                    self.getUserInfo()
                }
            }
        } else {
            // 카카오 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoAccount() success.")
                    // 사용자 정보 요청
                    self.getUserInfo()
                }
            }
        }
        
    }
    
    func getUserInfo() {
        UserApi.shared.me() { (user, error) in
            if let error = error {
                print(error)
            } else {
                print("me() suceess.")

                // 메인 화면으로 이동
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainVc = storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainViewController
                mainVc?.nickname = user?.kakaoAccount?.profile?.nickname
                self.view.window?.windowScene?.keyWindow?.rootViewController = mainVc
            }}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginWithEmailBtn.layer.cornerRadius = 5
        loginWithEmailBtn.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
    }


}

