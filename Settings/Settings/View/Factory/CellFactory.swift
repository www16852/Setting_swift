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
        cell.modifyButton = {
            let button = $0
            button.layer.borderWidth = 0.5
            return button
        }
        cell.modifyCoverButton = {return $0}
        cell.modifySubViews()
        return cell
    }
    
}
