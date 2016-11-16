//
//  TextCellContent.swift
//  Settings
//
//  Created by waltoncob on 2016/11/02.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class CellContent{

    private var title:String
    private var tapListeners:[CellTapListener] = []
    private var detail:String = " "

    //TextCell
    private var coverHidden:Bool = true
    //AccessoryCell
    private var pushTableContent:TableContent? = nil
    //switch
    private var switchHidden:Bool = true
    private var isOn:Bool = false
    //Button
    private var buttonHidden:Bool = true
    private var buttonColor:UIColor = UIColor(red: 0.8, green: 0.5, blue: 0.5, alpha: 1)


    public init(title:String, push:TableContent, detailIndex:Int?){
        self.title = title
        self.pushTableContent = push
        self.coverHidden = false
        if let index = detailIndex {
            if let indexContent = push.cellContent(index: index){
                self.detail = indexContent.getTitle()
            }else{
                print("Can not find detail string")
            }
        }else{
            self.detail = ""
        }
    }

    public init(title: String,detail: String, addTrigger:Bool = true){
        self.title = title
        self.detail = detail
        self.coverHidden = !addTrigger
    }

    public init(title: String, isOn:Bool){
        self.title = title
        self.isOn = isOn
        self.switchHidden = false
    }

    public init(title: String, buttonColor:UIColor = UIColor(red: 0.8, green: 0.5, blue: 0.5, alpha: 1)){
        self.title = title
        self.buttonColor = buttonColor
        self.buttonHidden = false
    }

    //MARK:get set

    public func set(title:String){
        self.title = title
    }

    public func set(detail:String){
        self.detail = detail
    }

    public func set(isOn:Bool){
        self.isOn = isOn
    }

    public func getTitle() -> String{
        return title
    }

    public func getDetail() -> String{
        return detail
    }

    public func getIsOn() -> Bool{
        return isOn
    }

    public func getSwitchHidden() -> Bool{
        return switchHidden
    }

    public func getButtonHidden() -> Bool{
        return buttonHidden
    }

    public func getCoverHidden() -> Bool{
        return coverHidden
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

    public func getValue() -> Any{
        if switchHidden == false{
            return isOn
        }else{
            return detail
        }
    }

    public func set(value:Any){
        if let str = value as? String{
            set(value: str)
        }else if let bool = value as? Bool{
            set(value: bool)
        }else{
            print("CellContent -set(value:Any) unknown parameter type")
        }
    }

    private func set(value:String){
        self.detail = value
    }

    private func set(value:Bool){
        self.isOn = value
    }

    public func add(tapListener:CellTapListener){
        tapListeners.append(tapListener)
    }
    
}
