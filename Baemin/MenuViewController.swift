//
//  MenuViewController.swift
//  Baemin
//
//  Created by 선가연 on 5/10/24.
//

import UIKit

class MenuViewController: UIViewController {
    var price = String()
    var dough = String()
    var topping = String()
    
    @IBOutlet weak var PriceButtonM: UIButton!
    @IBOutlet weak var PriceButtonL: UIButton!
    
    @IBOutlet weak var DoughButton1: UIButton!
    
    @IBOutlet weak var ToppingButton1: UIButton!
    @IBOutlet weak var ToppingButton2: UIButton!
    @IBOutlet weak var ToppingButton3: UIButton!
    @IBOutlet weak var ToppingButton4: UIButton!
    
    @IBOutlet weak var buttonIsGoToCart: UIButton!
    
    @IBAction func cartButtonDidTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cartViewController = storyboard.instantiateViewController(withIdentifier: "CartVC") as! CartViewController
        
        self.navigationController?.pushViewController(cartViewController, animated: true)
        //cartViewController
//        registerViewController.userInfo = { [weak self] (userInfo) in
//            // print(userInfo)
//            self?.userInfo = userInfo
//        }
    }
    
    @IBAction func PriceDidTapM(_ sender: UIButton) {
        if PriceButtonM.isSelected {
            PriceButtonM.isSelected = false
            self.price = "가격: M (20,000원)"
        }
        else {
            PriceButtonM.isSelected = true
        }
    }
    
    @IBAction func PriceDidTapL(_ sender: UIButton) {
        if PriceButtonL.isSelected {
            PriceButtonL.isSelected = false
            self.price = "가격: L (23,000원)"
        }
        else {
            PriceButtonL.isSelected = true
        }
    }
    
    
    @IBAction func DoughDidTap1(_ sender: UIButton) {
        if DoughButton1.isSelected {
            DoughButton1.isSelected = false
            self.dough = "도우변경: 크림리치골드 크러스트 (4,500원)"
        }
        else {
            DoughButton1.isSelected = true
        }
    }
    
    @IBAction func ToppingDidTap1(_ sender: UIButton) {
        if ToppingButton1.isSelected {
            self.topping = "토핑추가: 옥수수(30g)추가 (700원)"
        }
    }
    
    @IBAction func ToppingDidTap2(_ sender: UIButton) {
    }
    
    @IBAction func ToppingDidTap3(_ sender: UIButton) {
    }
    
    
    @IBAction func ToppingDidTap4(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
