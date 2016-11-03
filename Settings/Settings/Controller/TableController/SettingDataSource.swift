//
//  SettingDataSource.swift
//  Setting
//
//  Created by waltoncob on 2016/10/5.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class Section {

    fileprivate let header: String
    fileprivate let footer: String
    fileprivate var cellPacks: [MakeCellProtocol]
    fileprivate var heightForHeader: CGFloat
    fileprivate var heightForFooter: CGFloat

    public init(header: String,footer: String = "",CellPacks:[MakeCellProtocol] = [],
                heightForHeader: CGFloat = 40,heightForFooter: CGFloat = 10.0){
        self.header = header
        self.footer = footer
        self.cellPacks = CellPacks
        self.heightForHeader = heightForHeader
        self.heightForFooter = heightForFooter
    }

    public func add(cellPack:MakeCellProtocol){
        cellPacks.append(cellPack)
    }

    public func getCellPacks() -> [MakeCellProtocol]{
        return cellPacks
    }
    
}

class SettingDataSource:NSObject,UITableViewDataSource{

    private var sections:[Section]

    init(sections: [Section]){
        self.sections = sections
    }

    open func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cellPacks.count
    }

    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].header
    }

    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footer
    }

    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if sections[section].heightForHeader == 0 { return 0.00001 }
        return sections[section].heightForHeader
    }

    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if sections[section].heightForFooter == 0 { return 0.00001 }
        return sections[section].heightForFooter
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = sections[indexPath.section].cellPacks[indexPath.row].packToCell()
        return cell
    }

}
