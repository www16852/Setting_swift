//
//  listenerContainer.swift
//  Settings
//
//  Created by waltoncob on 2016/10/20.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class listenerContainer{

    public var listeners:[CellListener]

    var tapListener:[CellTapListener]{
        get{
            return listeners.filter{return $0 is CellTapListener} as! [CellTapListener]
        }
    }

    public init(listeners:[CellListener]){
        self.listeners = listeners
    }

    public init(){
        self.listeners = []
    }

}
