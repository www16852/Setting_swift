//
//  ButtonCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class ButtonCellPack:MakeCellProtocol{

    var title:String = " "
    var color:UIColor

    public var cellSet:(UITableViewCell) -> UITableViewCell = {return $0}

    public func packToCell() -> UITableViewCell{
        let cell = cellSet(ButtonCell(text: title,color: color))
        return cell
    }

    public init(title: String,color: UIColor = UIColor(red: 0.8, green: 0.5, blue: 0.5, alpha: 1)){
        self.title = title
        self.color = color
        if title == "" {self.title = " "}
    }
    
}
