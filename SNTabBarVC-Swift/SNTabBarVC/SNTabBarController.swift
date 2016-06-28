//
//  SNTabBarVC.swift
//  SNTabBarVC-Swift
//
//  Created by wangsen on 16/6/28.
//  Copyright © 2016年 wangsen. All rights reserved.
//

import UIKit

var m_tabBar:SNTabBar!

class SNTabBarController: UITabBarController , SNTabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
        self.tabBar.hidden = true
        
        m_tabBar = SNTabBar.init(frame: CGRectMake(kTabBarX, kTabBarY, kTabBarWidth, kTabBarHeight))
        m_tabBar.delegate = self
        self.view.addSubview(m_tabBar)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.removeOriginControls()
    }
    
    override func setViewControllers(viewControllers: [UIViewController]?, animated: Bool) {
        for vc:UIViewController in viewControllers! {
            m_tabBar.setTabBarItem(vc.tabBarItem)
        }
        super.setViewControllers(viewControllers, animated: animated)
    }
    
    func removeOriginControls() {
        for obj in self.tabBar.subviews {
            obj.removeFromSuperview()
        }
    }
    
    func tabBarDidSelectedItem(tabBar: SNTabBar, tabBarItem: SNTabBarItem, selectedIndex: NSInteger) -> Bool {
        self.selectedIndex = selectedIndex
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
