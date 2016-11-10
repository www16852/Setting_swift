//
//  SectionManager.swift
//  Settings
//
//  Created by waltoncob on 2016/10/21.
//  Copyright © 2016年 waltoncob. All rights reserved.
//
import Foundation

public class TableContent{

    private var sections:[Section]
    let delegate: UITableViewDelegate?
    let allowsSelection: Bool

    public init(header:String, options:[String], delegate: UITableViewDelegate? = nil, allowsSelection: Bool = true){
        self.delegate = delegate
        self.allowsSelection = allowsSelection
        var optionCellPacks = [MakeCellProtocol]()
        for str in options {
            let content = CellContent(title:str, detail: "", addTrigger:false)
            optionCellPacks.append(CellPack(content))
        }
        self.sections = [
            Section(header:header, CellPacks:optionCellPacks)
        ]

    }

    func makeSections(header:String, options:[String]) -> [Section]{
        var optionCellPacks = [MakeCellProtocol]()
        for str in options {
            let content = CellContent(title: str,detail: "", addTrigger:false)
            optionCellPacks.append(CellPack(content))
        }
        let tableSection = [
            Section(
                header: header,
                CellPacks: optionCellPacks
            )
        ]
        return tableSection
    }

    public init(sections:[Section], delegate: UITableViewDelegate? = nil, allowsSelection: Bool = false){
        self.sections = sections
        self.delegate = delegate
        self.allowsSelection = allowsSelection
    }

    public func getSections() -> [Section]{
        return sections
    }

    public func allCellContentsFromSections() -> [CellContent]{
        var cellContents:[CellContent] = []
        for section in sections{
            for pack in section.getCellPacks(){
                cellContents.append(pack.getCellContent())
            }
        }
        return cellContents
    }

    public func cellContent(index:Int) -> CellContent?{
        var i = 0
        var cellContent:CellContent?
        for section in sections{
            for pack in section.getCellPacks(){
                if index == i {
                    cellContent = pack.getCellContent()
                    return cellContent
                }
                i += 1
            }
        }
        return nil
    }

}
