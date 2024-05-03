//
//  UIViewController+Extension.swift
//  Catstagram
//
//  Created by 선가연 on 5/3/24.
//

import UIKit

extension UIViewController {
    func generateButtonAttribute(_ button: UIButton, texts: String..., fonts: UIFont..., colors: UIColor...) -> NSMutableAttributedString {
        // UIButton에 입력된 text를 가져온다
        guard let wholeText = button.titleLabel?.text else {
            fatalError("버튼에 텍스트가 없음.")
        }
        
        // 폰트들
        let customFonts: [UIFont] = fonts
        
        // 설정하고자 하는 String의 NSRanges
        let customTextsRagnes = texts.indices.map { index in (wholeText as NSString).range(of: texts[index])}
        
        let customColors = colors
        
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        texts.indices.forEach { index in
            attributedString.addAttribute(.font,
                                          value: customFonts[index],
                                          range: customTextsRagnes[index])
            attributedString.addAttribute(.foregroundColor,
                                          value: customColors[index],
                                          range: customTextsRagnes[index])
        }
        
        return attributedString
    }
}
