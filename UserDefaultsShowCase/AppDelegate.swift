//
//  AppDelegate.swift
//  UserDefaultsShowCase
//
//  Created by Aldiyar Aitpayev on 18.05.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        setupTabBar()
        return true
    }
    
    private func setupTabBar() {
        let tabBar = UITabBarController()
        tabBar.tabBar.tintColor = .black
        let firstScreen = UINavigationController(rootViewController: ViewController())
        firstScreen.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let secondScreen = UINavigationController(rootViewController: ViewController2())
        secondScreen.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "pencil.circle"), selectedImage: UIImage(systemName: "pencil.circle.fill"))
       
        tabBar.viewControllers = [firstScreen, secondScreen]
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
    

}

