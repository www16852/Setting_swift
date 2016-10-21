//
//  TextCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class TextCellPack:MakeCellProtocol,LoadPlist{

    var title:String = " "
    var detail:String = " "
    public var listeners:ListenerContainer

    public var cellSet:(UITableViewCell) -> UITableViewCell = {return $0}

    public func packToCell() -> UITableViewCell{
        let cell = cellSet(TextCell(text: title,detail: detail)) as! TextCell
        cell.listeners = listeners
        return cell
    }

    public func toPlist() -> (String,Any){
        return (title,detail)
    }

    public init(title: String,detail: String,listeners:ListenerContainer = ListenerContainer()){
        self.title = title
        self.detail = detail
        self.listeners = listeners
    }
    
}
