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
//
//  SettingDataSource.swift
//  Setting
//
//  Created by waltoncob on 2016/10/5.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class Section {

    fileprivate let header: String
    fileprivate let footer: String
    fileprivate var cellContents: [CellContent]
    fileprivate var heightForHeader: CGFloat
    fileprivate var heightForFooter: CGFloat

    public init(header: String,footer: String = "",contents:[CellContent] = [],
                heightForHeader: CGFloat = 40,heightForFooter: CGFloat = 10.0){
        self.header = header
        self.footer = footer
        self.cellContents = contents
        self.heightForHeader = heightForHeader
        self.heightForFooter = heightForFooter
    }

    public func add(content:CellContent){
        cellContents.append(content)
    }

    public func getcellContents() -> [CellContent]{
        return cellContents
    }
    
}

class SettingDataSource:NSObject,UITableViewDataSource{

    private var sections:[Section]
    private var factory:CellFactory

    init(sections: [Section], factory:CellFactory){
        self.sections = sections
        self.factory = factory
    }

    open func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cellContents.count
    }

    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].header
    }

    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footer
    }

    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if sections[section].heightForHeader == 0 { return 0.00001 }
        return sections[section].heightForHeader
    }

    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if sections[section].heightForFooter == 0 { return 0.00001 }
        return sections[section].heightForFooter
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let content = sections[indexPath.section].cellContents[indexPath.row]
        let cell = factory.makeCell(content)
        return cell
    }

}
