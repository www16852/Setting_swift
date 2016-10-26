//
//  ButtonCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class ButtonCellPack:MakeCellProtocol{

    private var title:String = " "
    private var color:UIColor
    private var listeners:[CellListener] = []

    public var cellSet:(UITableViewCell) -> UITableViewCell = {return $0}

    public init(title: String,color: UIColor = UIColor(red: 0.8, green: 0.5, blue: 0.5, alpha: 1),
                listeners:[CellListener] = []){
        self.title = title
        self.color = color
        self.listeners = listeners
        if title == "" {self.title = " "}
    }

//MARK: MakeCellProtocol

    public func packToCell() -> UITableViewCell{
        let cell = cellSet(ButtonCell(text: title,color: color)) as! ButtonCell
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
    }
    
}
