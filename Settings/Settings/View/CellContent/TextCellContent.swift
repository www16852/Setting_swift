//
//  TextCellContent.swift
//  Settings
//
//  Created by waltoncob on 2016/11/02.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class TextCellContent{

    private var title:String
    private var detail:String
    private var accessoryType:UITableViewCellAccessoryType
    private var listeners:[CellListener]

    private var tableContent:TableContent?
    private var sections = [Section]()

    public init(title: String,detail: String,listeners:[CellListener] = [],accessory:UITableViewCellAccessoryType = .none){
        self.title = title
        self.detail = detail
        self.listeners = listeners
        self.accessoryType = .disclosureIndicator
    }
    
}
