//
//  SaveController.swift
//  Settings
//
//  Created by waltoncob on 2016/11/8.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class SaveController:CellTapListener{

    unowned let plistManager:PlistManager

    public init(plist:PlistManager){
        self.plistManager = plist
    }

    public func tapAction(sender:UITableViewCell){
        print("T:\(sender.textLabel?.text) trigger SaveController")
        self.plistManager.savePlist()
    }

}
