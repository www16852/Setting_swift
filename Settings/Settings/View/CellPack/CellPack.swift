//
//  TextCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class CellPack:MakeCellProtocol{

    private var cellContent:CellContent

    public init(_ cellContent:CellContent){
        self.cellContent = cellContent
    }

//MARK: MakeCellProtocol

    public func packToCell() -> EventCell{
        let cell = EventCell(cellContent:cellContent)
        cell.set(tapListeners: cellContent.getTapListeners())
        return cell
    }

    public func getCellContent() -> CellContent{
        return cellContent
    }

}
