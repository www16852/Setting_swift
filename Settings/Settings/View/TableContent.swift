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
    private var factory:CellFactory
    let delegate: UITableViewDelegate?
    let allowsSelection: Bool

    public init(header:String, options:[String], factory:CellFactory, delegate: UITableViewDelegate? = nil, allowsSelection: Bool = true){
        self.delegate = delegate
        self.allowsSelection = allowsSelection
        self.factory = factory
        var optionCellContents = [CellContent]()
        for str in options {
            let content = CellContent(title:str, detail: "", addTrigger:false)
            optionCellContents.append(content)
        }
        self.sections = [
            Section(header:header, contents:optionCellContents)
        ]
    }

    public init(sections:[Section], factory:CellFactory, delegate: UITableViewDelegate? = nil, allowsSelection: Bool = false){
        self.sections = sections
        self.delegate = delegate
        self.allowsSelection = allowsSelection
        self.factory = factory
    }

    public func cellContent(index:Int) -> CellContent?{
        var i = 0
        for section in sections{
            for content in section.getcellContents(){
                if index == i {
                    return content
                }
                i += 1
            }
        }
        return nil
    }

    //MARK: get set

    public func getSections() -> [Section]{
        return sections
    }

    public func getFactory() -> CellFactory{
        return factory
    }

    public func getCellContents() -> [CellContent]{
        var cellContents:[CellContent] = []
        for section in sections{
            for content in section.getcellContents(){
                cellContents.append(content)
            }
        }
        return cellContents
    }

}
