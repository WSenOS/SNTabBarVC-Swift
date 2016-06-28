//
//  SNTabBar.swift
//  SNTabBarVC-Swift
//
//  Created by wangsen on 16/6/28.
//  Copyright © 2016年 wangsen. All rights reserved.
//

import UIKit

protocol SNTabBarDelegate {
   func tabBarDidSelectedItem(tabBar:SNTabBar, tabBarItem:SNTabBarItem, selectedIndex:NSInteger) -> Bool
}

class SNTabBar: UIView {
    
    var delegate:SNTabBarDelegate?

    var defaultSelectedIndex:NSInteger!
    
    var selectedItem:SNTabBarItem!

//    lazy var items:Array<AnyObject> = { [] }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultSelectedIndex = 0
        self.backgroundColor = UIColor.blackColor()
    }
    
    func setTabBarItem(tabBarItem:UITabBarItem) {
        
        let snTabBarItem = tabBarItem
        let tabBarItem:SNTabBarItem = SNTabBarItem()
        tabBarItem.addTarget(self, action: #selector(SNTabBar.tabBarItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(tabBarItem)
        
        tabBarItem.setCustomTabBarItem(snTabBarItem)
        
//        items.append(tabBarItem)
        
        let count:NSInteger = self.subviews.count
        
        for index in 0..<count {
            let item = self.subviews[index]
            item.frame = CGRectMake(0  + (kTabBarWidth / CGFloat(count)) * CGFloat(index), 0, kTabBarWidth/CGFloat(count), kTabBarHeight)
            item.tag = kItemTag + index
            if index == self.defaultSelectedIndex {
                self.tabBarItemAction(item)
            }
        }
        
    }
    
    func tabBarItemAction(obj:AnyObject) {
        let item:SNTabBarItem = obj as! SNTabBarItem
        var isSelected:Bool = false
        isSelected = (self.delegate?.tabBarDidSelectedItem(self, tabBarItem: item, selectedIndex: item.tag - kItemTag))!
        if isSelected {
            if (self.selectedItem != nil) {
                self.selectedItem.selected = false;
                item.selected = true;
                self.selectedItem = item;
            } else {
                item.selected = true;
                self.selectedItem = item;
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
