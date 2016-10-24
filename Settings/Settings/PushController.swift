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

    public init(controller: UIViewController){
        self.controller = controller
    }

    public func tapAction(cell:UITableViewCell){
        print("T:\(cell.textLabel?.text) PushController.tapAction ")
    }

}
