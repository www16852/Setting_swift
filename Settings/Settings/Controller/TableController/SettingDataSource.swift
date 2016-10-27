//
//  SettingDataSource.swift
//  Setting
//
//  Created by waltoncob on 2016/10/5.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public struct Section {

    fileprivate let header: String
    fileprivate let footer: String
    let CellPacks: [MakeCellProtocol]
    fileprivate var heightForHeader: CGFloat
    fileprivate var heightForFooter: CGFloat

    public init(header: String,footer: String,CellPacks: [MakeCellProtocol],heightForHeader: CGFloat = 40,heightForFooter: CGFloat = 40){
        self.header = header
        self.footer = footer
        self.CellPacks = CellPacks
        self.heightForHeader = heightForHeader
        self.heightForFooter = heightForFooter
    }
    
}

class SettingDataSource:NSObject,UITableViewDataSource{

    private var sectionManager:SectionManager
    private var sections:[Section]

    init(sectionManager: SectionManager){
        self.sectionManager = sectionManager
        self.sections = sectionManager.getSections()
    }

    open func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].CellPacks.count
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
        let cell = sections[indexPath.section].CellPacks[indexPath.row].packToCell()
        if let eventCell = cell as? EventCell{
            eventCell.setTrigger()
        }
        return cell
    }

}
