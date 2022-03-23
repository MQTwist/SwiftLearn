//
//  VIewAnimationVC.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/1.
//

import UIKit

enum Week {
    case one
    case two
    case three
}

class VIewAnimationVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        mqButton()
        testEnum()
    }

    func mqButton() {
        let btn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        btn.center = view.center
        btn.backgroundColor = .red
        btn.setTitle("button", for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func btnAction(btn: UIButton) {
        UIView.animate(withDuration: 1) {
            btn.transform = CGAffineTransform.init(translationX: 0, y: 200)
        } completion: { (true) in
            btn.transform = CGAffineTransform.identity
        }
    }
    
    func testEnum() {
        let weekDay = Week.one
        switch weekDay {
            case .one:
                print("周一")
            case .two:
                print("周二")
            case .three:
                print("周三")
        }
    }
    
}
