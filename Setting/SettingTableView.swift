//
//  SettingTableView.swift
//  Setting
//
//  Created by waltoncob on 2016/10/5.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

class SettingTableView: UITableView {

    var dataSourcePtr:UITableViewDataSource?
    var delegatePtr:UITableViewDelegate?

    init(frame: CGRect,tableSections:[Section],controller:SettingController){
        self.dataSourcePtr = SettingDataSource(sections:tableSections,controller:controller)
//        self.delegatePtr = TickTableDelegate()
        super.init(frame: frame, style: .plain)
        self.dataSource = dataSourcePtr
        self.delegate = delegatePtr
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

