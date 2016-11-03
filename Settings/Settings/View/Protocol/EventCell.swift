//
//  CellHandler.swift
//  Settings
//
//  Created by waltoncob on 2016/10/20.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

public protocol EventCell{
    func add(listener:CellListener)
    func remove(listener:CellListener)
//    func setTrigger()                 cell內執行
//    func tapAction()                  cell內執行
//    func getContent() -> (String,Any)  綁物件後不用透過cell傳key出去
}
