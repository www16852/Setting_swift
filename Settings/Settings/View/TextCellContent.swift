//
//  TextCellContent.swift
//  Settings
//
//  Created by waltoncob on 2016/11/02.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class TextCellContent:CellContent{

    private var title:String
    private var detail:String
    private var accessoryType:UITableViewCellAccessoryType
    private var listeners:[CellListener]

    private var tableContent:TableContent?
    private var sections = [Section]()

    public init(title: String,detail: String,listeners:[CellListener] = []){
        self.title = title
        self.detail = detail
        self.listeners = listeners
        self.accessoryType = .none
    }

//MARK:get set

    public func set(title:String,detail:String){
        self.title = title
        self.detail = detail
    }

    public func getTitle() ->String{
        return title
    }

    public func getDetail() ->String{
        return detail
    }

    public func getAccessoryType() -> UITableViewCellAccessoryType{
        return accessoryType
    }

    public func getSections() -> [Section]{
        return sections
    }

    public func getTableContent() -> TableContent?{
        return tableContent
    }

//MARK:CellContent_protocol

    public func getKey() -> String{
        return title
    }

    public func getValue() -> Any?{
        return detail
    }

    public func set(value:Any){
        self.detail = value as! String
    }

}
