//
//  SwitchController.swift
//  Settings
//
//  Created by waltoncob on 2016/10/25.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class SwitchController:CellListener{

    public var saveC:SectionManager!

    public init(){

    }

    public func tapAction(cell:UITableViewCell){
        print("T:\(cell.textLabel?.text) PushController.tapAction ")
        save(cell)
    }

    public func save(_ cell:UITableViewCell){
        if let eventCell = cell as? EventCell{
            let (key,value) = eventCell.getContent()
            saveC.update(forKey: key, value: value)
        }
        saveC.savePlist()
    }

}
