//
//  PushController.swift
//  Setting
//
//  Created by waltoncob on 2016/10/6.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class PushController:CellListener{

    unowned let controller:UIViewController
    public var saveC:SectionManager!

    public init(controller: UIViewController){
        self.controller = controller
    }

    public func tapAction(cell:UITableViewCell){
        print("T:\(cell.textLabel?.text) PushController.tapAction ")
        let pushCell = cell as! AccessoryCell
        controller.navigationController?.pushViewController(pushCell.getController(), animated: true)
        save(cell)
    }

    func save(_ cell:UITableViewCell){
        if let eventCell = cell as? EventCell{
            let (key,value) = eventCell.getContent()
            saveC.update(forKey: key, value: value)
        }
        saveC.savePlist()
    }

}
