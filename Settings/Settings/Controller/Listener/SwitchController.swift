//
//  SwitchController.swift
//  Settings
//
//  Created by waltoncob on 2016/10/25.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class SwitchController:CellListener{

    private var dataManager:SectionManager!

    public init(){

    }

    public func set(manager:SectionManager){
        self.dataManager = manager
    }

    public func tapAction(sender:UITableViewCell){
        print("T:\(sender.textLabel?.text) PushController.tapAction ")
        save(sender)
    }

    public func save(_ cell:UITableViewCell){
        if let eventCell = cell as? EventCell{
            let (key,value) = eventCell.getContent()
            dataManager.update(forKey: key, value: value)
        }
    }

}
