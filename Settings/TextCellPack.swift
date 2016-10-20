//
//  TextCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class TextCellPack:MakeCellProtocol{

    var title:String = " "
    var detail:String = " "
    public var listeners:listenerContainer

    public var cellSet:(UITableViewCell) -> UITableViewCell = {return $0}

    public func packToCell() -> UITableViewCell{
        let cell = cellSet(TextCell(text: title,detail: detail)) as! TextCell
        cell.listeners = listeners
        return cell
    }

    public init(title: String,detail: String,listeners:listenerContainer = listenerContainer()){
        self.title = title
        self.detail = detail
        self.listeners = listeners
    }
    
}
