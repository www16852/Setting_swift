//
//  PushController.swift
//  Setting
//
//  Created by waltoncob on 2016/10/6.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class PushController:CellListener,ReturnedViewControllerDelegate{

    unowned let controller:UIViewController
    unowned let plistManager:PlistManager

    public init(controller: UIViewController, plist:PlistManager){
        self.controller = controller
        self.plistManager = plist
    }

    public func tapAction(sender:UITableViewCell){
        print("T:\(sender.textLabel?.text) PushController.tapAction ")
        pushVC(sender)
    }

    func pushVC(_ cell:UITableViewCell){
        let accessoryCell = cell as! AccessoryCell
        let title = controller.navigationItem.title
        let viewController = ReturnViewController(sender:accessoryCell, table:accessoryCell.makeTableView(), backTitle:title, delegate:self)
        controller.navigationController?.pushViewController(viewController, animated: true)
    }

//MARK:ReturnedVCDelegate

    public func backFromVC(accessoryCell:AccessoryCell, result:String?){
        print("T: backFromVC return result = \(result)")
        plistManager.savePlist()
    }

}
