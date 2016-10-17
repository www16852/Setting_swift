//
//  TextCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/26.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public struct TextCellPack:MakeCellProtocol{

    var title:String = " "
    var detail:String = " "
//    var cellSet = {(cell:TextCell) -> TextCell in return cell}
    public var cellSet:(TextCell) -> TextCell = {return $0}

    public func packToCell() -> UITableViewCell{
        let cell = cellSet(TextCell(text: title,detail: detail))
        return cell
    }

    public init(title: String,detail: String){
        self.title = title
        self.detail = detail
    }

}

public class TextCell:UITableViewCell{

    public convenience init(text: String, detail: String){
        self.init(style: UITableViewCellStyle.value1,reuseIdentifier: nil)
        self.textLabel?.text = text
        self.detailTextLabel?.text = detail
    }

}
