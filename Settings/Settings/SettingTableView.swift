//
//  SettingTableView.swift
//  Setting
//
//  Created by waltoncob on 2016/10/5.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public struct TableContent {

    fileprivate var frame: CGRect
    fileprivate let delegate: UITableViewDelegate?
    fileprivate let allowsSelection: Bool

    public init(frame: CGRect, delegate: UITableViewDelegate? = nil,allowsSelection: Bool = false){
        self.frame = frame
        self.delegate = delegate
        self.allowsSelection = allowsSelection
    }

    public init(delegate: UITableViewDelegate? = nil,allowsSelection: Bool = false){
        self.init(frame: CGRect.zero, delegate: delegate, allowsSelection:allowsSelection)
    }


}

public class SettingTableView: UITableView {

    private var dataSourcePtr:UITableViewDataSource?
    private var delegatePtr:UITableViewDelegate?

    public init(content: TableContent, tableSections: [Section], controller: SettingController){
        self.dataSourcePtr = SettingDataSource(sections:tableSections,controller:controller)
        super.init(frame: content.frame, style: .plain)
        self.setDelegate(delegate: content.delegate)
        self.allowsSelection = content.allowsSelection
        self.dataSource = dataSourcePtr
    }

    func setDelegate(delegate: UITableViewDelegate?){
        self.delegatePtr = delegate
        self.delegate = delegatePtr
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

