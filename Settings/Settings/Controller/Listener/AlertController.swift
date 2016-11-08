//
//  AlertController.swift
//  Settings
//
//  Created by waltoncob on 2016/10/25.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class AlertController:CellTapListener{

    unowned let controller:UIViewController

    public init(controller: UIViewController){
        self.controller = controller
    }

    public func tapAction(sender:UITableViewCell){
        print("T:\(sender.textLabel?.text) trigger AlertController")
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

