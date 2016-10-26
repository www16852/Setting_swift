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
    func setTrigger()
    func tapAction()
    func getContent() -> (String,Any)
}
