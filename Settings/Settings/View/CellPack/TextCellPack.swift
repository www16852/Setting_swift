//
//  TextCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class TextCellPack:MakeCellProtocol{

    private var cellContent:TextCellContent

    public init(_ cellContent:TextCellContent){
        self.cellContent = cellContent
    }

//MARK: MakeCellProtocol

    public func packToCell() -> UITableViewCell{
        let rCell:UITableViewCell!
        if cellContent.getPushTableContent() == nil {
            let cell = TextCell(cellContent:cellContent)
            cell.set(tapListeners: cellContent.getTapListeners())
            rCell = cell
        }else{
            let cell = AccessoryCell(cellContent:cellContent)
            cell.set(tapListeners: cellContent.getTapListeners())
            rCell = cell
        }
        
        return rCell
    }

    public func getCellContent() -> CellContent{
        return cellContent
    }

}
