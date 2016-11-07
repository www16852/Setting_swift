//
//  TextCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/26.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class TextCell:UITableViewCell{

    private var listeners:[CellListener] = []
    private var cellContent:TextCellContent

    public init(cellContent:TextCellContent){
        self.cellContent = cellContent
        super.init(style: UITableViewCellStyle.value1,reuseIdentifier: nil)
        self.textLabel?.text = cellContent.getTitle()
        self.detailTextLabel?.text = cellContent.getDetail()
        if cellContent.getAllowAddTrigger() == true {
            setupTrigger()
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupTrigger(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        gesture.delegate = self
        self.addGestureRecognizer(gesture)
    }

    public func tapAction(){
        print("T:\(type(of:self)) tapAction")
        for tapL in listeners{
            tapL.tapAction(sender: self)
        }
    }

    public func update(){
        self.textLabel?.text = cellContent.getTitle()
        self.detailTextLabel?.text = cellContent.getDetail()
    }

    public func set(listeners:[CellListener]){
        self.listeners = listeners
    }

}
