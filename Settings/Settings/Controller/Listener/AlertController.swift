//
//  AlertController.swift
//  Settings
//
//  Created by waltoncob on 2016/10/25.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class AlertController:CellListener{

    unowned let controller:UIViewController
    unowned let plistManager:PlistManager
    let alert:UIAlertController? = nil

    public init(controller: UIViewController, plist:PlistManager){
        self.controller = controller
        self.plistManager = plist
    }

    public func tapAction(sender:UITableViewCell){
        print("T:\(sender.textLabel?.text) PushController.tapAction ")
        pushVC(sender)
    }

    func pushVC(_ cell:UITableViewCell){
        let alert = UIAlertController(title: "Enabling Camera Uploads", message:
            nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default){(action) in })
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default){(action) in })
        controller.present(alert, animated: true, completion: nil)
    }

}

