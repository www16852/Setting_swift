//
//  MakeCellProtocol.swift
//  Settings
//
//  Created by waltoncob on 2016/11/9.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

public protocol CellFactory{
    func makeCell(_ content:CellContent) -> EventCell
}
