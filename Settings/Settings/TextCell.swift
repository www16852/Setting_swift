//
//  TextCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/26.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class TextCell:UITableViewCell,EventCell,LoadPlist{

    public var listeners:ListenerContainer!

    public init(text: String, detail:String){
        super.init(style: UITableViewCellStyle.value1,reuseIdentifier: nil)
        self.textLabel?.text = text
        self.detailTextLabel?.text = detail
    }

    public func toPlist() -> (String,Any){
        return (textLabel!.text!,detailTextLabel!.text!)
    }

    public func addGesture(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAction(obj:)))
        self.addGestureRecognizer(gesture)
    }

    public func tapAction(obj:AnyObject){
        print("T: TextCell.tapAction")
        for tapL in listeners.tapListener{
            tapL.tapAction(cell: self)
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
