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
        let cell:UITableViewCell!
        if cellContent.getPushTableContent() == nil {
            cell = TextCell(cellContent:cellContent)
            print("T: \(cellContent.getTitle())  getPushTableContent() == nil")
        }else{
            cell = AccessoryCell(cellContent:cellContent)
            print("T: \(cellContent.getTitle())  getPushTableContent() != nil")
        }
        return cell
    }

    public func getCellContent() -> CellContent{
        return cellContent
    }

}
