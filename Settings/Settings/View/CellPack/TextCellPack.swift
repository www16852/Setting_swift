//
//  TextCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class TextCellPack:MakeCellProtocol{

    private var title:String = " "
    private var detail:String = " "
    private var listeners:ListenerContainer

    public var cellSet:(UITableViewCell) -> UITableViewCell = {return $0}

    public func packToCell() -> UITableViewCell{
        let cell = cellSet(TextCell(text: title,detail: detail)) as! TextCell
        return cell
    }

    public init(title: String,detail: String,listeners:ListenerContainer = ListenerContainer()){
        self.title = title
        self.detail = detail
        self.listeners = listeners
    }
    
}
