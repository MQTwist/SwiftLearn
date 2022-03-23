//
//  TableViewHeader.swift
//  SwiftDemo	
//
//  Created by 3ttyy on 2022/2/28.
//

import Foundation
import UIKit
import SnapKit

class HeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addUI() {
        let avatar = UIImageView.init()
        avatar.backgroundColor = .red
        addSubview(avatar)
        let height: Float = 100
        avatar.snp.makeConstraints { make in
            make.width.height.equalTo(height)
            make.center.equalTo(self)
        }
        avatar.layer.cornerRadius = CGFloat(height / 2)
    }
}
