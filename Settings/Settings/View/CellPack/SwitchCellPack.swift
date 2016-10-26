//
//  SwitchCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class SwitchCellPack:MakeCellProtocol,LoadPlist{

    var title:String = " "
    var isOn:Bool = false

    public var listeners:[CellListener] = []

    public var cellSet:(UITableViewCell) -> UITableViewCell = {return $0}

    public var key:String{
        get{
            return title
        }
    }
    public var value:Any{
        get{
            return isOn
        }
        set{
            isOn = newValue as! Bool
        }
    }

    public func packToCell() -> UITableViewCell{
        let cell = cellSet(SwitchCell(text: title)) as! SwitchCell
        cell.boolSwitch.isOn = self.isOn
        for listener in listeners{
            cell.add(listener: listener)
        }
        return cell
    }

    public init(title: String, listeners:[CellListener] = []){
        self.title = title
        if title == "" {self.title = " "}
        self.listeners = listeners
    }
    
}
