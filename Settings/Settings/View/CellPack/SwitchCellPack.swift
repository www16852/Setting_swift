//
//  SwitchCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class SwitchCellPack{

    private var title:String
    private var isOn:Bool = false
    private var listeners:[CellListener]

    public var cellSet:(UITableViewCell) -> UITableViewCell = {return $0}

    public init(title: String, listeners:[CellListener] = []){
        self.title = title
        if title == "" {self.title = " "}
        self.listeners = listeners
    }

//MARK: MakeCellProtocol
    
    public func packToCell() -> UITableViewCell{
        let cell = cellSet(SwitchCell(text: title)) as! SwitchCell
        cell.set(on: isOn)
        for listener in listeners{
            cell.add(listener: listener)
        }
        return cell
    }

    public func getKey() -> String {
        return title
    }

    public func set(key:String, value:Any){
        self.title = key
        self.isOn = value as! Bool
    }
    
}
