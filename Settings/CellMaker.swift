//
//  CellMaker.swift
//  Settings
//
//  Created by waltoncob on 2016/10/14.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class CellMaker{

        public class func makeTickSections(header:String, options:[String]) -> [Section]{
            var optionCell = [MakeCellProtocol]()
            for str in options {
                var pack = TextCellPack(title: str,detail: "")
                pack.cellSet = {
                    $0.selectionStyle = .none
                    return $0
                }
                optionCell.append(pack)
            }
            let tableSection = [
                Section(
                    header: header,
                    footer: "",
                    CellPacks: optionCell,
                    heightForFooter: 10.0
                )
            ]
            return tableSection
        }

        public class func makeSections(header:String, options:[String]) -> [Section]{
            var optionCell = [MakeCellProtocol]()
            for str in options as [String]{
                let pack = TextCellPack(title: str,detail: "")
                optionCell.append(pack)
            }
            let tableSection = [
                Section(
                    header: header,
                    footer: "",
                    CellPacks: optionCell,
                    heightForFooter: 10.0
                )
            ]
            return tableSection
        }

}
