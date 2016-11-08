//
//  ShareListener.swift
//  Settings
//
//  Created by waltoncob on 2016/11/4.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class ShareListener:CellTapListener{

    unowned let controller:UIViewController

    public init(controller: UIViewController){
        self.controller = controller
    }

    public func tapAction(sender:UITableViewCell){
        print("T:\(sender.textLabel?.text) trigger ShareController")
        pushVC(sender)
    }

    func pushVC(_ cell:UITableViewCell){
        let accessoryCell = cell as! AccessoryCell
        let title = controller.navigationItem.title
        let viewController = ShareViewController(sender:accessoryCell, table:accessoryCell.makeTableView(), backTitle:title)
        controller.navigationController?.pushViewController(viewController, animated: true)
    }

    //MARK:ReturnedVCDelegate

    public func backFromVC(accessoryCell:AccessoryCell, result:String?){
        print("T: backFromVC return result = \(result)")
    }
    
}
