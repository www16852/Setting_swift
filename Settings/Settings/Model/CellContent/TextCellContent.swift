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
    private var tapListeners:[CellTapListener] = []

    //TextCell
    private var allowAddTrigger:Bool = true
    //AccessoryCell
    private var pushTableContent:TableContent?

    public init(title: String,detail: String, push:TableContent? = nil){
        self.title = title
        self.detail = detail
        self.pushTableContent = push
    }

    public convenience init(title: String,detail: String, addTrigger:Bool){
        self.init(title: title,detail: detail)
        self.allowAddTrigger = addTrigger
    }

    //MARK:get set

    public func set(title:String){
        self.title = title
    }

    public func set(detail:String){
        self.detail = detail
    }

    public func set(pushTableContent:TableContent){
        self.pushTableContent = pushTableContent
    }

    public func getTitle() -> String{
        return title
    }

    public func getDetail() -> String{
        return detail
    }

    public func getAllowAddTrigger() -> Bool{
        return allowAddTrigger
    }

    public func getPushTableContent() -> TableContent?{
        return pushTableContent
    }

    public func getTapListeners() -> [CellTapListener]{
        return tapListeners
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

    public func add(tapListener:CellTapListener){
        tapListeners.append(tapListener)
    }
    
    public func remove(listener:CellTapListener){
        
    }
    
}
