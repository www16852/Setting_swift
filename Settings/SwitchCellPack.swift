//
//  SwitchCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class SwitchCellPack:MakeCellProtocol{

    var title:String = " "

    public var listeners:ListenerContainer

    public var cellSet:(UITableViewCell) -> UITableViewCell = {return $0}

    public func packToCell() -> UITableViewCell{
        let cell = cellSet(SwitchCell(text: title)) as! SwitchCell
        cell.listeners = listeners
        return cell
    }

    public init(title: String, listeners:ListenerContainer = ListenerContainer()){
        self.title = title
        if title == "" {self.title = " "}
        self.listeners = listeners
    }
    
}
