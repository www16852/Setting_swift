//
//  AccessoryCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class AccessoryCellPack:MakeCellProtocol{

    var title:String = " "
    var detail:String = " "
    public var listeners:ListenerContainer

    var tableContent:TableContent = TableContent(delegate: nil, allowsSelection: true)
    var sections = [Section]()

    public var cellSet:(UITableViewCell) -> UITableViewCell = {return $0}

    public func packToCell() -> UITableViewCell{
        let cell = cellSet(AccessoryCell(text: title, detail: detail, tableContent:tableContent, sections: sections)) as! AccessoryCell
        cell.listeners = listeners
        return cell
    }

    public init(title: String, detail: String, tableContent:TableContent, sections: [Section], listeners:ListenerContainer = ListenerContainer()){
        self.title = title
        self.detail = detail
        self.tableContent = tableContent
        self.sections = sections
        self.listeners = listeners
    }
    
}
