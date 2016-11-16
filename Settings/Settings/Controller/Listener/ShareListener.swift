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

    public func tapAction(sender:EventCell){
        print("\(sender.textLabel?.text) trigger ShareController")
        pushViewController(sender)
    }

    func pushViewController(_ cell:EventCell){
        let title = controller.navigationItem.title
        let viewController = ShareViewController(sender:cell, table:cell.makeTableView(), backTitle:title)
        controller.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
