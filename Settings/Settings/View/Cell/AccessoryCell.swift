//
//  AccessoryCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/27.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class AccessoryCell:UITableViewCell,EventCell,SavePlist,PushCell{

    public var listeners:ListenerContainer!
    var detailSection:SectionManager
    var tableContent:TableContent

    public init(text: String, detail: String, tableContent:TableContent, sections: [Section]){
        self.detailSection = SectionManager(sections:sections)
        self.tableContent = tableContent
        super.init(style: .value1,reuseIdentifier: nil)
        self.textLabel?.text = text
        self.detailTextLabel?.text = detail
        self.accessoryType = .disclosureIndicator
    }

    public func getController() -> UIViewController{
        let controller = UIViewController()
        let stView = SettingTableView(content: tableContent, sectionManager:detailSection)
        controller.view = stView
        return controller
    }

    public func toPlist() -> (String,Any){
        return (textLabel!.text!,detailTextLabel!.text!)
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
