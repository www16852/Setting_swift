//
//  AccessoryCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/27.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public struct AccessoryCellPack:MakeCellProtocol{

    var title:String = " "
    var detail:String = " "
    var tableContent:TableContent = TableContent(delegate: nil, allowsSelection: true)
    var sections = [Section]()

    public var cellSet:(UITableViewCell) -> UITableViewCell = {return $0}

    public func packToCell() -> UITableViewCell{
        let cell = cellSet(AccessoryCell(text: title, detail: detail, tableContent:tableContent, sections: sections))
        return cell
    }

    public init(title: String, detail: String, tableContent:TableContent, sections: [Section]){
        self.title = title
        self.detail = detail
        self.tableContent = tableContent
        self.sections = sections
    }

}

public class AccessoryCell:UITableViewCell{

    var detailSections = [Section]()
    var tableContent:TableContent

    public init(text: String, detail: String, tableContent:TableContent, sections: [Section]){
        self.detailSections = sections
        self.tableContent = tableContent
        super.init(style: .value1,reuseIdentifier: nil)
        self.textLabel?.text = text
        self.detailTextLabel?.text = detail
        self.accessoryType = .disclosureIndicator
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

