////
////  ButtonCellPack.swift
////  Settings
////
////  Created by waltoncob on 2016/10/19.
////  Copyright © 2016年 waltoncob. All rights reserved.
////

import UIKit

public class ButtonCellPack:MakeCellProtocol{

    private var cellContent:ButtonCellContent

    public init(_ cellContent:ButtonCellContent){
        self.cellContent = cellContent
    }

    //MARK: MakeCellProtocol

    public func packToCell() -> UITableViewCell{
        let rCell:UITableViewCell!
        if cellContent.getIsOn() == nil {
            let cell = ButtonCell(cellContent:cellContent)
            cell.set(listeners: cellContent.getListeners())
            rCell = cell
        }else{
            let cell = SwitchCell(cellContent:cellContent)
            cell.set(listeners: cellContent.getListeners())
            rCell = cell
        }

        return rCell
    }

    public func getCellContent() -> CellContent{
        return cellContent
    }

}
