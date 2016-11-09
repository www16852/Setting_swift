//
//  AlertListener.swift
//  Settings
//
//  Created by waltoncob on 2016/10/25.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class AlertListener:CellTapListener{

    unowned let controller:UIViewController
    unowned let plistManager:PlistManager

    public init(controller: UIViewController, plist:PlistManager){
        self.controller = controller
        self.plistManager = plist
    }

    public func tapAction(sender:EventCell){
        print("T:\(sender.textLabel?.text) trigger AlertController")
        pushVC(sender)
        plistManager.savePlist()
    }

    func pushVC(_ cell:EventCell){
        let alert = UIAlertController(title: "Enabling Camera Uploads", message:
            nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default){(action) in })
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default){(action) in })
        controller.present(alert, animated: true, completion: nil)
    }

}

