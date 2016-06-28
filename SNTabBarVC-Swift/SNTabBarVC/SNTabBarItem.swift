//
//  SNTabBarItem.swift
//  SNTabBarVC-Swift
//
//  Created by wangsen on 16/6/28.
//  Copyright © 2016年 wangsen. All rights reserved.
//

import UIKit

public var itemImageScale:CGFloat!

class SNTabBarItem: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        itemImageScale = 0.7
        self.adjustsImageWhenHighlighted = false //使触摸模式下按钮也不会变暗
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        self.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCustomTabBarItem(customTabBarItem:UITabBarItem) {
        
        self.setImage(customTabBarItem.image, forState: UIControlState.Normal)
        self.setImage(customTabBarItem.selectedImage, forState: UIControlState.Selected)
        self.setTitle(customTabBarItem.title, forState: UIControlState.Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let titleX:CGFloat = 0.0
        let titleY:CGFloat = contentRect.size.height * itemImageScale
        let titleW:CGFloat = contentRect.size.width
        let titleH:CGFloat = contentRect.size.height * (1 - itemImageScale)
        
        return CGRectMake(titleX, titleY, titleW, titleH)
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let imageX:CGFloat = 0.0
        let imageY:CGFloat = 5.0
        let imageW:CGFloat = contentRect.size.width
        let imageH:CGFloat = contentRect.size.height * itemImageScale - imageY * 2
        
        return CGRectMake(imageX, imageY, imageW, imageH)
    }
    

}
