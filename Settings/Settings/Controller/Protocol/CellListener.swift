//
//  CellListener.swift
//  Settings
//
//  Created by waltoncob on 2016/10/19.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public protocol CellListener{

}

public protocol CellTapListener:CellListener{
    func tapAction(cell:UITableViewCell)
}