//
//  LoadPlist.swift
//  Settings
//
//  Created by waltoncob on 2016/10/25.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public protocol LoadPlist{
    var key:String {get}
    var value:Any {get set}
}
