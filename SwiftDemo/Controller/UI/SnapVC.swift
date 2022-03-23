//
//  SnapVC.swift
//  SwiftDemo
//
//  Created by MQTwist on 2022/3/9.
//

import UIKit

class SnapVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(buton)
        buton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.center.equalTo(view)
        }
    }
    
    private lazy var buton: UIButton = {
        let btn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        btn.center = view.center
        btn.backgroundColor = .red
        btn.setTitle("button", for: .normal)
        btn.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        view.addSubview(btn)
        return btn
    }()
    
    @objc func btnAction(sender: UIButton) {
        sender.setTitle("sender", for: .normal)
    }
}
