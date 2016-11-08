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
    unowned let plistManager:PlistManager

    public init(controller: UIViewController, plist:PlistManager){
        self.controller = controller
        self.plistManager = plist
    }

    public func tapAction(sender:UITableViewCell){
        print("T:\(sender.textLabel?.text) trigger PushController")
        pushVC(sender)
    }

    func pushVC(_ cell:UITableViewCell){
        let accessoryCell = cell as! AccessoryCell
        let title = controller.navigationItem.title
        let viewController = ReturnViewController(sender:accessoryCell, table:accessoryCell.makeTableView(), backTitle:title){
            self.plistManager.savePlist()
        }
        controller.navigationController?.pushViewController(viewController, animated: true)
    }

}
