//
//  TextCellPack.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class CellPack:MakeCellProtocol{

    private var cellContent:TextCellContent

    public init(_ cellContent:TextCellContent){
        self.cellContent = cellContent
    }

//MARK: MakeCellProtocol

    public func packToCell() -> UITableViewCell{
        let cell = EventCell(cellContent:cellContent)
        cell.set(tapListeners: cellContent.getTapListeners())
        return cell
    }

    public func getCellContent() -> TextCellContent{
        return cellContent
    }

}
