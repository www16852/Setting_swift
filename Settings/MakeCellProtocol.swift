//
//  MakeCellProtocol.swift
//  Settings
//
//  Created by waltoncob on 2016/10/14.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public protocol MakeCellProtocol{
    func packToCell() -> UITableViewCell
    var cellSet:(UITableViewCell) -> UITableViewCell {get set}
}
