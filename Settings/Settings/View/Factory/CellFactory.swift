//
//  CellFactory.swift
//  Settings
//
//  Created by waltoncob on 2016/11/16.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class CellFactory:MakeCellProtocol{

    public init(){

    }

    //MARK: MakeCellProtocol

    public func makeCell(_ content:CellContent) -> EventCell{
        let cell = EventCell(cellContent:content)
        cell.set(tapListeners: content.getTapListeners())

        cell.modifySwitch = {return $0}
        cell.modifyColorButton = {return $0}
        cell.modifyCoverButton = {return $0}
        cell.modifySubViews()
        return cell
    }
    
}
