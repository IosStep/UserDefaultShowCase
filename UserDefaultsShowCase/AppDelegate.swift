//
//  AppDelegate.swift
//  UserDefaultsShowCase
//
//  Created by Aldiyar Aitpayev on 18.05.2024.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow()
        setupTabBar()
        setupNotifications()
        application.registerForRemoteNotifications()
        return true
    }
    
    private func setupNotifications() {
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
          options: authOptions,
          completionHandler: { _, _ in }
        )


    }
    
    private func setupTabBar() {
        let tabBar = UITabBarController()
        tabBar.tabBar.tintColor = .black
        let firstScreen = UINavigationController(rootViewController: ViewController())
        firstScreen.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let secondScreen = UINavigationController(rootViewController: ViewController2())
        secondScreen.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "pencil.circle"), selectedImage: UIImage(systemName: "pencil.circle.fill"))
        
        let thirdScreen = UINavigationController(rootViewController: ViewController3())
        thirdScreen.tabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "folder"), selectedImage: UIImage(systemName: "folder.fill"))
       
        tabBar.viewControllers = [firstScreen, secondScreen, thirdScreen]
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
    

    
}

