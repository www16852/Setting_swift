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
    var delegatePtr:UITableViewDelegate?

    public init(content: TableContent, sectionManager:SectionManager){
        self.dataSourcePtr = SettingDataSource(sectionManager:sectionManager)
        super.init(frame: content.frame, style: .plain)
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

