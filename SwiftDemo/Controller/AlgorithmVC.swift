//
//  CoreAnimationVC.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/1.
//

import UIKit

class AlgorithmVC: BaseTableViewVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configData() {
        dataArr = [("1", "字符串翻转"), ("2", "Climbing Stairs(爬楼梯)")]
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc: BaseVC?
        switch indexPath.row {
            case 0:
                vc = CharReverseVC()
            case 1:
                vc = ClimbingStairsVC()
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
