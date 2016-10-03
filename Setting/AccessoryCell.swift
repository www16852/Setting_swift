//
//  AccessoryCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/27.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class AccessoryCell:UITableViewCell,CellSelectProtocol{

    var detailSections = [Section]()
    var pushType:PushType

    public init(text: String, detail: String, sections: [Section], push:PushType, style: UITableViewCellStyle = .value1){
        self.detailSections = sections
        self.pushType = push
        super.init(style: style,reuseIdentifier: nil)
        self.textLabel?.text = text
        self.detailTextLabel?.text = detail
        self.accessoryType = .disclosureIndicator
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    public func selectAction(){
        print("selectAction")
    }

}

public extension AccessoryCell{
    enum PushType{
        case sub
        case share
    }
}
