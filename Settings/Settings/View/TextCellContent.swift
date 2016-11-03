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
    private var listeners:[CellListener]

    private var pushTableContent:TableContent?

    public init(title: String,detail: String,listeners:[CellListener] = [], push:TableContent? = nil){
        self.title = title
        self.detail = detail
        self.listeners = listeners
        self.pushTableContent = push
    }

//MARK:get set

    public func set(title:String,detail:String){
        self.title = title
        self.detail = detail
    }

    public func set(pushTableContent:TableContent){
        self.pushTableContent = pushTableContent
    }

    public func getTitle() ->String{
        return title
    }

    public func getDetail() ->String{
        return detail
    }

    public func getPushTableContent() -> TableContent?{
        return pushTableContent
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
