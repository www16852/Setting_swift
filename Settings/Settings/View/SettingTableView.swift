//
//  SettingTableView.swift
/*
 * Copyright (C) 2016 Xu,Cheng Wei <www16852@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
//  Setting
//
//  Created by waltoncob on 2016/10/5.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class SettingTableView: UITableView {

    private var dataSourcePtr:UITableViewDataSource?
    private var delegatePtr:UITableViewDelegate?

    public init(content:TableContent){
        self.dataSourcePtr = SettingDataSource(sections:content.getSections(), factory:content.getFactory())
        super.init(frame: CGRect.zero, style: .plain)
        self.setDelegate(delegate: content.delegate)
        self.allowsSelection = content.allowsSelection
        self.dataSource = dataSourcePtr
//        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func setDelegate(delegate: UITableViewDelegate?){
        self.delegatePtr = delegate
        self.delegate = delegatePtr
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: AutoLayout
//    override public func layoutSubviews() {
//        updateConstraints()
//        super.layoutSubviews()
//    }
//
//    override public func updateConstraints() {
//        superview?.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview , attribute: .trailing, multiplier: 1, constant: 0))
//        superview?.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview , attribute: .leading, multiplier: 1, constant: 0))
//        superview?.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: superview , attribute: .height, multiplier: 1, constant: 0))
//        superview?.addConstraint(NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview , attribute: .centerY, multiplier: 1, constant: 0))
//
//        super.updateConstraints()
//    }

}

