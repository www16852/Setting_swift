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
        if let cell = cell as? SavePlist{
            let (key,value) = cell.toPlist()
            saveC.dictionary.updateValue(value, forKey: key)
        }
        saveC.savePlist()
    }
    
}
