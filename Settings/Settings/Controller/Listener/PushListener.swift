//
//  PushListener.swift
//  Setting
//
//  Created by waltoncob on 2016/10/6.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class PushListener:CellTapListener{

    unowned let controller:UIViewController
    unowned let plistManager:PlistManager

    public init(controller: UIViewController, plist:PlistManager){
        self.controller = controller
        self.plistManager = plist
    }

    public func tapAction(sender:EventCell){
        print("T:\(sender.textLabel?.text) trigger PushController")
        pushViewController(sender)
    }

    func pushViewController(_ cell:EventCell){
        let title = controller.navigationItem.title
        let viewController = ReturnViewController(sender:cell, table:cell.makeTableView(), backTitle:title){
            self.plistManager.savePlist()
        }
        controller.navigationController?.pushViewController(viewController, animated: true)
    }

}
