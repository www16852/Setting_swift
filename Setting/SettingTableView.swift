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

    init(frame: CGRect,tableSections:[Section]){
        super.init(frame: frame, style: .plain)
        self.dataSourcePtr = SettingDataSource(tableSections:tableSections)
        self.dataSource = dataSourcePtr
        self.delegatePtr = TickTableDelegate()
        self.delegate = delegatePtr
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

