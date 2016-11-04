//
//  CellContent.swift
//  Settings
//
//  Created by waltoncob on 2016/11/2.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

public protocol CellContent{
    func getKey() -> String
    func getValue() -> Any?
    func set(value:Any)
    func add(listener:CellListener)
    func remove(listener:CellListener)
    func getListeners() -> [CellListener]
}
