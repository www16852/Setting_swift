//
//  AccessoryCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/27.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class AccessoryCell:UITableViewCell{

    private var tapListeners:[CellTapListener] = []
    private var tableContent:TableContent
    private var cellContent:TextCellContent

    public init(cellContent:TextCellContent){
        self.tableContent = cellContent.getPushTableContent()!
        self.cellContent = cellContent
        super.init(style: .value1,reuseIdentifier: nil)
        self.accessoryType = .disclosureIndicator
        updateView()
        setupTrigger()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func makeTableView() -> SettingTableView{
        let stView = SettingTableView(content:tableContent)
        return stView
    }

    public func setupTrigger(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        self.addGestureRecognizer(gesture)
    }

    public func tapAction(){
        print("T:\(type(of:self)) tapAction")
        for tapL in tapListeners{
            tapL.tapAction(sender: self)
        }
    }

    public func updateView(){
        self.textLabel?.text = cellContent.getTitle()
        self.detailTextLabel?.text = cellContent.getDetail()
    }

//MARK:get set

    public func getCellContent() -> TextCellContent{
        return cellContent
    }

    public func set(tapListeners:[CellTapListener]){
        self.tapListeners = tapListeners
    }
    
}

