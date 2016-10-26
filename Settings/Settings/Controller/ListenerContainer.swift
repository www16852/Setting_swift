//
//  listenerContainer.swift
//  Settings
//
//  Created by waltoncob on 2016/10/20.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class ListenerContainer{

    public var listeners:[CellListener]

    public init(listeners:[CellListener]){
        self.listeners = listeners
    }

    public init(){
        self.listeners = []
    }

}
