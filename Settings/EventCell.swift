//
//  CellHandler.swift
//  Settings
//
//  Created by waltoncob on 2016/10/20.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public protocol EventCell{
    var listeners:ListenerContainer!{get set}
    func tapAction(obj:AnyObject)
}
