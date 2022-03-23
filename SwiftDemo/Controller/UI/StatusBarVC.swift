//
//  StatusBarVC.swift
//  SwiftDemo
//
//  Created by MQTwist on 2022/3/11.
//

import UIKit

class StatusBarVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        mqButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func mqButton() {
        let btn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        btn.center = view.center
        btn.backgroundColor = .red
        btn.setTitle("button", for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func btnAction() {
        self.navigationController?.popViewController(animated: true)
    }

}
