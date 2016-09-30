//
//  AccessoryCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/27.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class AccessoryCell:UITableViewCell,CellSelectProtocol{

    public init(text: String, detail: String){
        super.init(style: UITableViewCellStyle.value1,reuseIdentifier: nil)
        self.selectionStyle = .blue
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
