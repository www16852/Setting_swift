//
//  TextCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/26.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class TextCell:UITableViewCell,EventCell{

    public init(cellContent:TextCellContent){
        super.init(style: UITableViewCellStyle.value1,reuseIdentifier: nil)
        self.textLabel?.text = cellContent.getTitle()
        self.detailTextLabel?.text = cellContent.getDetail()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func toPlist() -> (String,Any){
        return (textLabel!.text!,detailTextLabel!.text!)
    }

//MARK:EvenCell
    public func add(listener:CellListener){

    }

    public func remove(listener:CellListener){

    }

    public func setTrigger(){

    }

    public func tapAction(){
        
    }

    public func getContent() -> (String,Any){
        return (textLabel!.text!,detailTextLabel!.text!)
    }

}
