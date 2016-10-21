//
//  AccessoryCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/27.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class AccessoryCell:UITableViewCell{

    public var listeners:ListenerContainer!
    var detailSections = [Section]()
    var tableContent:TableContent

    public init(text: String, detail: String, tableContent:TableContent, sections: [Section]){
        self.detailSections = sections
        self.tableContent = tableContent
        super.init(style: .value1,reuseIdentifier: nil)
        self.textLabel?.text = text
        self.detailTextLabel?.text = detail
        self.accessoryType = .disclosureIndicator
        addGesture()
    }

    public func addGesture(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAction(obj:)))
        self.addGestureRecognizer(gesture)
    }

    public func tapAction(obj:AnyObject){
        print("T:AccesoryCell tapAction")
        for tapL in listeners.tapListener{
            tapL.tapAction(cell: self)
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

