//
//  SavePlist.swift
//  Settings
//
//  Created by waltoncob on 2016/10/21.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public protocol SavePlist{
    func cellToPlist() -> [String:Any]
}
