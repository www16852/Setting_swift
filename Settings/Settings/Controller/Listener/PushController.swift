//
//  PushController.swift
//  Setting
//
//  Created by waltoncob on 2016/10/6.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class PushController:CellTapListener{

    unowned let controller:UIViewController
    public var saveC:SectionManager!

    public init(controller: UIViewController){
        self.controller = controller
    }

    public func tapAction(cell:UITableViewCell){
        print("T:\(cell.textLabel?.text) PushController.tapAction ")
        save(cell)
        let pushCell = cell as! PushCell
        controller.navigationController?.pushViewController(pushCell.getController(), animated: true)
    }

    func save(_ cell:UITableViewCell){
        if let cell = cell as? SavePlist{
            let (key,value) = cell.toPlist()
            saveC.dictionary.updateValue(value, forKey: key)
        }
        saveC.savePlist()
    }

}
