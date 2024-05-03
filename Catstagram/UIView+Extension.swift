//
//  UIView+Extension.swift
//  Catstagram
//
//  Created by 선가연 on 5/3/24.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat { // 모따기
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
