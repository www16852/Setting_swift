//
//  AccessoryCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/27.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class AccessoryCell:UITableViewCell,CellSelectProtocol{

    var detailTableCell = [UITableViewCell]()

    public convenience init(text: String, detail: String, style: UITableViewCellStyle = .value1,cellArray: [UITableViewCell]){
        self.init(style: style,reuseIdentifier: nil)
        self.textLabel?.text = text
        self.detailTextLabel?.text = detail
        self.accessoryType = .disclosureIndicator
        self.detailTableCell = cellArray
    }


    public func selectAction(){
        print("selectAction")
    }

}
