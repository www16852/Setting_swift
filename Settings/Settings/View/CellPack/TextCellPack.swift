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
        switch cellContent.getAccessoryType() {
        case .none:
            cell = TextCell(cellContent:cellContent)
        case .disclosureIndicator:
            cell = AccessoryCell(cellContent:cellContent)
        default:
            print("Not defined AccessoryType")
            cell = UITableViewCell()
        }
        return cell
    }

    public func getCellContent() -> CellContent{
        return cellContent
    }

}
