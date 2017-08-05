//
//  TextFieldListener.swift
//  Example
//
//  Created by XU,cheng-wei on 2017/8/6.
//  Copyright © 2017年 waltoncob. All rights reserved.
//

import UIKit
import Settings

public class TextFieldListener:CellTapListener{
    
    unowned let controller:UIViewController
    private var message:String
    
    public init(controller: UIViewController, message:String){
        self.controller = controller
        self.message = message
    }
    
    public func tapAction(sender:EventCell){
        let alert = UIAlertController(title: sender.getTextFieldTitle(), message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default){(action) in })
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default){(action) in })
        controller.present(alert, animated: true, completion: nil)
    }
    
}
