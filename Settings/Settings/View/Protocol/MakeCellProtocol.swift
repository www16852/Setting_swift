//
//  MakeCellProtocol.swift
//  Settings
//
//  Created by waltoncob on 2016/10/14.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

public protocol MakeCellProtocol{
    func packToCell() -> UITableViewCell
    func getKey() -> String
    func set(key:String, value:Any)
//    var listeners:ListenerContainer {get set}
//    var cellSet:(UITableViewCell) -> UITableViewCell {get set}
}
