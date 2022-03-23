//
//  BaseTableViewVC.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/2.
//

import UIKit

class BaseTableViewVC: BaseVC, UITableViewDelegate, UITableViewDataSource {

    var dataArr = [("学习", "闭包"), ("ID", "8888"), ("性别", "男"), ("位置", "郑州市"), ("生日/星座", "1990-08-08 / 天秤座")]
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor.init(red: 243 / 255, green: 243 / 255, blue: 246 / 255, alpha: 1)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "mq")
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        configData()
    }
    
    func setUpUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: (UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0) + 49, right: 0))
        }
    }
    
    func configData() {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mq", for: indexPath) as? TableViewCell
        cell?.titleLabel.text = dataArr[indexPath.row].0
        cell?.contentLabel.text = dataArr[indexPath.row].1
        return cell ?? TableViewCell()
    }
}
