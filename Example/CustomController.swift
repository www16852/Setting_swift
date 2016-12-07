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
//  CustomController.swift
//  Setting
//
//  Created by waltoncob on 2016/9/29.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit
import Settings

let userEmail = "Box03@walton.com.tw"
let userDevice = "IOS-66-789"
let version = "1.0.13"
var dayOption:[String] = ["5days","10days","15days","20days"]
var shareOption:[String] = ["t1@walton.com.tw","t2@walton.com.tw","t3@walton.com.tw","t4@walton.com.tw"]

class CustomController: UIViewController {
    let plistManager = PlistManager()
    let factory = SimpleCellFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Setting"

        var sections = [Section]()
        let section1 = Section(header: "ACCOUNT")
        section1.add(content:CellContent(title: "Email",detail: userEmail))
        section1.add(content:CellContent(title: "Device",detail: userDevice))
        section1.add(content:CellContent(title: "Version",detail: version))
        sections.append(section1)

        let section2 = Section(header: "SETTING")

        let alertContent = CellContent(title:"Carmera Uploads", isOn:false)
        let alertListener = AlertListener(controller:self,plist:plistManager)
        alertContent.add(tapListener: alertListener)
        section2.add(content:(alertContent))
        sections.append(section2)

        let section3 = Section(header: "MANAGEMENT")
        section3.add(content:CellContent(title: "Space Used",detail: ""))

        let LegalPsuhTable = TableContent(header:"", options:[], factory:factory)
        let LegalCellContent = CellContent(title: "Legal and Privacy", push:LegalPsuhTable, detailIndex:nil)
        section3.add(content: LegalCellContent)

        let keepDaysPushTable = TableContent(header:"choose Keep Days", options:dayOption, factory:factory, delegate: TickTableDelegate())
        let keepDaysCellContent = CellContent(title: "Keep Days", push:keepDaysPushTable, detailIndex:0)
        let pushListener = PushListener(controller:self, plist:plistManager)
        keepDaysCellContent.add(tapListener:pushListener)
        section3.add(content:(keepDaysCellContent))

        section3.add(content:CellContent(title: "Connected",detail: "UPnP"))

        let sharePushTable = TableContent(header:"Share Management", options:shareOption, factory:factory)
        let shareCellContent = CellContent(title: "Share Management", push:sharePushTable, detailIndex:nil)
        let pushShareListener = ShareListener(controller:self)
        shareCellContent.add(tapListener: pushShareListener)
        section3.add(content:(shareCellContent))

        section3.add(content:CellContent(title:"Sign out",buttonColor:UIColor(red: 0.8, green: 0.5, blue: 0.5, alpha: 1)))

        sections.append(section3)

        let tableContent = TableContent(sections:sections, factory:factory)
        let cellContents = tableContent.getCellContents()

        plistManager.setup(cellContents:cellContents)
        print("Plist path : \(plistManager.plistPathInDocument)")
        plistManager.adjustCellContents()

        let tableview = SettingTableView(content:tableContent)
        view = tableview

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }  
    }
    
}

