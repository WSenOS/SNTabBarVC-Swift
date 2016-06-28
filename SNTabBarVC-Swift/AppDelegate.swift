//
//  AppDelegate.swift
//  SNTabBarVC-Swift
//
//  Created by wangsen on 16/6/28.
//  Copyright © 2016年 wangsen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let vc1 = UIViewController()
        vc1.tabBarItem.title = "哈哈"
        vc1.tabBarItem.image = UIImage.init(named: "numberDefault")
        vc1.tabBarItem.selectedImage = UIImage.init(named: "numberSelected")
        let nav1 = UINavigationController.init(rootViewController: vc1)
        
        let vc2 = UIViewController()
        vc2.tabBarItem.title = "呵呵"
        vc2.tabBarItem.image = UIImage.init(imageLiteral: "orderDefault")
        vc2.tabBarItem.selectedImage = UIImage.init(named: "orderSelected")
        let nav2 = UINavigationController.init(rootViewController: vc2)

        
        
        let tabBarVC = SNTabBarController()
        tabBarVC.viewControllers = [nav1,nav2]
//        tabBarVC.setViewControllers([nav1,nav2], animated: false)
        self.window?.rootViewController = tabBarVC
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

