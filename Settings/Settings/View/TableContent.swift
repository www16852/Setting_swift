//
//  SectionManager.swift
//  Settings
//
//  Created by waltoncob on 2016/10/21.
//  Copyright © 2016年 waltoncob. All rights reserved.
//
import Foundation

public class TableContent{

    private var sections:[Section]
    let delegate: UITableViewDelegate?
    let allowsSelection: Bool
    
    public init(sections:[Section], delegate: UITableViewDelegate? = nil,allowsSelection: Bool = false){
        self.sections = sections
        self.delegate = delegate
        self.allowsSelection = allowsSelection
    }

    public func getSections() -> [Section]{
        return sections
    }

}
