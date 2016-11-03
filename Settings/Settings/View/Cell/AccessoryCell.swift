//
//  AccessoryCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/27.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class AccessoryCell:UITableViewCell,EventCell{

    private var listeners:[CellListener] = []
    private var tableContent:TableContent

    public init(cellContent:TextCellContent){
        self.tableContent = cellContent.getTableContent()!
        super.init(style: .value1,reuseIdentifier: nil)
        self.textLabel?.text = cellContent.getTitle()
        self.detailTextLabel?.text = cellContent.getDetail()
        self.accessoryType = .disclosureIndicator
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func getTableView() -> SettingTableView{
        let stView = SettingTableView(content:tableContent)
        return stView
    }

    public func setupTrigger(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        self.addGestureRecognizer(gesture)
    }

    public func tapAction(){
        print("T:AccesoryCell tapAction")
        for tapL in listeners{
            tapL.tapAction(sender: self)
        }
    }

//MARK:EvenCell

    public func add(listener:CellListener){
        self.listeners.append(listener)
    }

    public func remove(listener:CellListener){

    }
    
}

