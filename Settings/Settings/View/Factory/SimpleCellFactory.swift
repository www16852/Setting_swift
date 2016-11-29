//
//  CellFactory.swift
//  Settings
//
//  Created by waltoncob on 2016/11/16.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class SimpleCellFactory:CellFactory{

    public init(){

    }

    //MARK: CellFactory

    public func makeCell(_ content:CellContent) -> EventCell{
        let cell = EventCell(cellContent:content)
        cell.set(tapListeners: content.getTapListeners())

        cell.modifySwitch = {(origin:UISwitch) in return origin}
        cell.modifyColorButton = {(origin:UIButton) in return origin}
        cell.modifyCoverButton = {(origin:UIButton) in return origin}
        cell.modifySubViews()
        return cell
    }
    
}
