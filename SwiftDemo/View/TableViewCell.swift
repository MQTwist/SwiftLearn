//
//  MQTableViewCell.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/2/28.
//

import UIKit
import SnapKit


class TableViewCell: UITableViewCell {
    
    lazy var bgView: UIView = {
        let view = UIView.init()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.text = "Title"
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel.init()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.text = "Content"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor.init(red: 243 / 255, green: 243 / 255, blue: 246 / 255, alpha: 1)
        addUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addUI() {
        contentView.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.top.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(0)
        }
        
        bgView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalTo(10)
        }
        
        bgView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
        }
    }
    
}
