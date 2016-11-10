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
let userDevice = "WAS-14-003"
let version = "1.0.13"
var dayOption:[String] = ["5days","10days","15days","20days"]
var shareOption:[String] = ["t1@walton.com.tw","t2@walton.com.tw","t3@walton.com.tw","t4@walton.com.tw"]



class CustomController: UIViewController {
    let plistManager = PlistManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Setting"

        var sections = [Section]()
        let section1 = Section(header: "ACCOUNT")
        section1.add(cellPack:CellPack(CellContent(title: "Email",detail: userEmail)))
        section1.add(cellPack:CellPack(CellContent(title: "Device",detail: userDevice)))
        section1.add(cellPack:CellPack(CellContent(title: "Version",detail: version)))
        sections.append(section1)

        let section2 = Section(header: "SETTING")

        let alertContent = CellContent(title:"Carmera Uploads", isOn:false)
        let alertListener = AlertListener(controller:self,plist:plistManager)
        alertContent.add(tapListener: alertListener)
        section2.add(cellPack:CellPack(alertContent))
        sections.append(section2)

        let section3 = Section(header: "MANAGEMENT")
        section3.add(cellPack:CellPack(CellContent(title: "Space Used",detail: "")))

        let LegalPsuhTable = TableContent(header:"", options:[])
        let LegalCellContent = CellContent(title: "Legal and Privacy", push:LegalPsuhTable, detailIndex:nil)
        section3.add(cellPack: CellPack(LegalCellContent))

        let keepDaysPushTable = TableContent(header:"choose Keep Days", options:dayOption, delegate: TickTableDelegate())
        let keepDaysCellContent = CellContent(title: "Keep Days", push:keepDaysPushTable, detailIndex:0)
        let pushListener = PushListener(controller:self, plist:plistManager)
        keepDaysCellContent.add(tapListener:pushListener)
        section3.add(cellPack:CellPack(keepDaysCellContent))

        section3.add(cellPack:CellPack(CellContent(title: "Connected",detail: "UPnP")))

        let sharePushTable = TableContent(header:"Share Management", options:shareOption)
        let shareCellContent = CellContent(title: "Share Management", push:sharePushTable, detailIndex:nil)
        let pushShareListener = ShareListener(controller:self)
        shareCellContent.add(tapListener: pushShareListener)
        section3.add(cellPack:CellPack(shareCellContent))

        section3.add(cellPack:CellPack(CellContent(title:"Sign out")))

        sections.append(section3)

        let tableContent = TableContent(sections:sections)
        let cellContents = tableContent.allCellContentsFromSections()

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

