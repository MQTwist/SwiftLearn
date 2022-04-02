//
//  UIKitVC.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/1.
//

import UIKit

class UIKitVC: BaseTableViewVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func configData() {
        dataArr = [("1", "Snap"), ("2", "ViewAnimation"), ("3", "UIStatusBarStyle"), ("4", "FlutterHome")]
        tableView.reloadData()
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        var vc: BaseVC?
        switch indexPath.row {
            case 0:
                vc = SnapVC()
            case 1:
                vc = VIewAnimationVC()
            case 2:
                vc = StatusBarVC()
            case 3:
//                let vc = FlutterVC.init(engine: flutterEngine, nibName: nil, bundle: nil)
                let vc = FlutterVC.init(project: nil, initialRoute: "ListPage", nibName: nil, bundle: nil)
                vc.title = dataArr[indexPath.row].1
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
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
