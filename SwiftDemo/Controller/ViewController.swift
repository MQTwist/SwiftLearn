//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/2/28.
//

import UIKit
import SnapKit

class ViewController: BaseTableViewVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let headerView = HeaderView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 120))
        tableView.tableHeaderView = headerView
    }
    
    override func configData() {
        dataArr = [("1", "闭包"), ("2", "Class And Struct"), ("3", "Mirror"), ("4", "Traverse"), ("5", "Func"), ("6", "GetSet"), ("7", "String")]
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc: BaseVC?
        switch indexPath.row {
            case 0:
                vc = Closure()
            case 1:
                vc = ClassAndStructVC()
            case 2:
                vc = MirrorVC()
            case 3:
                vc = TraverseVC()
            case 4:
                vc = FuncVC()
            case 5:
                vc = GetSetVC()
            case 6:
                vc = StringVC()
            default:
                break
        }
        guard let vc = vc else {
            return
        }
        vc.title = dataArr[indexPath.row].1
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

}



