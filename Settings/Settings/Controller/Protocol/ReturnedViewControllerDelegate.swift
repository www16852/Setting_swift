////
////  CellListener.swift
////  Settings
////
////  Created by waltoncob on 2016/10/19.
////  Copyright © 2016年 waltoncob. All rights reserved.
////

public protocol ReturnedViewControllerDelegate:class{
    func backFromVC(accessoryCell:AccessoryCell, result:String?)
}
