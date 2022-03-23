//
//  NetWorkVC.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/2.
//

import UIKit

class NetWorkVC: BaseTableViewVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func configData() {
        dataArr = [("网络", "Alamofire")]
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc: BaseVC?
        switch indexPath.row {
            case 0:
                vc = AlamofireVC()
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
