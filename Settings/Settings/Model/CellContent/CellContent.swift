/*
 * Copyright (C) 2016 Xu,Cheng Wei <www16852@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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

    //TextFieldCell
    private var textFieldHidden:Bool = true
    private var textFieldDetail = ""
    //TextCell
    private var coverHidden:Bool = true
    //AccessoryCell
    private var pushTableContent:TableContent? = nil
    //switch
    private var switchHidden:Bool = true
    private var isOn:Bool = false
    //Button
    private var buttonColor:UIColor?


    public init(title:String, push:TableContent, detailIndex:Int?){
        self.title = title
        self.pushTableContent = push
        self.coverHidden = false
        if let index = detailIndex {
            if let indexContent = push.cellContent(index: index){
                self.detail = indexContent.getTitle()
            }else{
                print("Settings:the index can not find detail string")
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
    
    public init(textTitle: String,detail: String){
        self.title = textTitle
        self.textFieldDetail = detail
        self.textFieldHidden = false
    }

    public init(title: String, isOn:Bool){
        self.title = title
        self.isOn = isOn
        self.switchHidden = false
    }

    public init(title: String, buttonColor:UIColor){
        self.title = title
        self.buttonColor = buttonColor
        self.coverHidden = false
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
    
    public func getTextFieldDetail() -> String{
        return textFieldDetail
    }

    public func getIsOn() -> Bool{
        return isOn
    }

    public func getButtonColor() -> UIColor?{
        return buttonColor
    }

    public func getSwitchHidden() -> Bool{
        return switchHidden
    }

    public func getCoverHidden() -> Bool{
        return coverHidden
    }
    
    public func getTextFieldHidden() -> Bool{
        return textFieldHidden
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
            print("Settings:CellContent -set(value:Any) unknown parameter type")
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
