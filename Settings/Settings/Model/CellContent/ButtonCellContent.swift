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
    private var tapListeners:[CellTapListener] = []

    //switch
    private var isOn:Bool?
    private var turnOnListeners:[CellTapListener] = []

    public init(title: String, isOn:Bool? = nil){
        self.title = title
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

    public func getTapListeners() -> [CellTapListener]{
        return tapListeners
    }

    public func getTurnOnListeners() -> [CellTapListener]{
        return turnOnListeners
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

    public func add(tapListener:CellTapListener){
        tapListeners.append(tapListener)
    }

    public func add(turnOnListener:CellTapListener){
        turnOnListeners.append(turnOnListener)
    }

    public func remove(listener:CellTapListener){
        
    }

}
