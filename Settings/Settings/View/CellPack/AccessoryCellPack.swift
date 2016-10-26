//
//  AccessoryCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class AccessoryCellPack:MakeCellProtocol{

    private var title:String = " "
    private var detail:String = " "
    private var listeners:[CellListener]

    private var tableContent:TableContent = TableContent(delegate: nil, allowsSelection: true)
    private var sections = [Section]()

    public var cellSet:(UITableViewCell) -> UITableViewCell = {return $0}

    public init(title: String, detail: String, tableContent:TableContent, sections: [Section], listeners:[CellListener] = []){
        self.title = title
        self.detail = detail
        self.tableContent = tableContent
        self.sections = sections
        self.listeners = listeners
    }

//MARK: MakeCellProtocol

    public func packToCell() -> UITableViewCell{
        let cell = cellSet(AccessoryCell(text: title, detail: detail, tableContent:tableContent, sections: sections)) as! AccessoryCell
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
        self.detail = value as! String
    }

}
