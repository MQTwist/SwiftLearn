//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/2/28.
//

import UIKit
import Foundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        createTabbar()
        
        return true
    }
    
    func createTabbar() {
        
        if let delegate = UIApplication.shared.delegate {
            let delegate = delegate as! AppDelegate
            
            let homeVC = ViewController()
            homeVC.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(), selectedImage: UIImage())
            let uiVC = UIKitVC()
            uiVC.tabBarItem = UITabBarItem.init(title: "UI", image: UIImage(), selectedImage: UIImage())
            let caVC = AlgorithmVC()
            caVC.tabBarItem = UITabBarItem.init(title: "Algorithm", image: UIImage(), selectedImage: UIImage())
            let netVC = NetWorkVC()
            netVC.tabBarItem = UITabBarItem.init(title: "Net", image: UIImage(), selectedImage: UIImage())
            
            let homeNav = BaseNavigationController.init(rootViewController: homeVC)
            let uiNav = BaseNavigationController.init(rootViewController: uiVC)
            let caNav = BaseNavigationController.init(rootViewController: caVC)
            let netNav = BaseNavigationController.init(rootViewController: netVC)
            
//            UITabBar.appearance().backgroundImage = UIImage()
//            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
            
            let tabbarController = MQTabbarController()
            tabbarController.viewControllers = [homeNav, uiNav, caNav, netNav]
            delegate.window?.rootViewController = tabbarController
            delegate.window?.makeKeyAndVisible()
        }
    }

}

