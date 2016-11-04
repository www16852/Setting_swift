//
//  File.swift
//  Settings
//
//  Created by waltoncob on 2016/11/4.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class ButtonCellContent:CellContent{

    private var title:String
    private var isOn:Bool?
    private var listeners:[CellListener]

    public init(title: String, isOn:Bool? = nil, listeners:[CellListener] = []){
        self.title = title
        self.listeners = listeners
        self.isOn = isOn
    }

    //MARK:get set

    public func set(title:String){
        self.title = title
    }

    public func set(isOn:Bool){
        self.isOn = isOn
    }

    public func getTitle() ->String{
        return title
    }

    public func getIsOn() -> Bool?{
        return isOn
    }

    public func getListeners() -> [CellListener]{
        return listeners
    }

    //MARK:CellContent_protocol

    public func getKey() -> String{
        return title
    }

    public func getValue() -> Any?{
        return isOn
    }

    public func set(value:Any){
        self.isOn = (value as! Bool)
    }

    public func add(listener:CellListener){
        listeners.append(listener)
    }

    public func remove(listener:CellListener){
        
    }

}
