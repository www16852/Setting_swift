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
    var switchControll:[CellListener] = []
    var pushControll:[CellListener] = []

    var LegalContent = TextCellContent(title: "Legal and Privacy", detail: "")
    var keepDaysContnet = TextCellContent(title: "Keep Days",detail: "5 days")
    var shareContent = TextCellContent(title: "Share Management",detail: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        let sections = firstTableSections()
        let cellContents = firstCellContents(sections)
        let plistManager = PlistManager(cellContents:cellContents)
        print("Plist path : \(plistManager.plistPathInDocument)")
        plistManager.adjustCellContents()

        let tableContent = TableContent(sections:sections)

        let tableview = SettingTableView(content:tableContent)
        view = tableview

        setupLegalContent()
    }

    func setupLegalContent(){
//        LegalContent
    }

    func firstCellContents(_ sections:[Section]) -> [CellContent]{
        var cellContents:[CellContent] = []
        for section in sections{
            for pack in section.CellPacks{
                cellContents.append(pack.getCellContent())
            }
        }
        return cellContents
    }

    func firstTableSections() -> [Section]{

        let sections:[Section] = [
            Section(
                header: "ACCOUNT",
                footer: "",
                CellPacks: [
                    TextCellPack(TextCellContent(title: "Email",detail: userEmail)),
                    TextCellPack(TextCellContent(title: "Device",detail: userDevice)),
                    TextCellPack(TextCellContent(title: "Version",detail: version))
                ],
                heightForFooter: 10.0
            ),
//            Section(
//                header: "SETTING",
//                footer: "",
//                CellPacks: [
//                    SwitchCellPack(title: "Carmera Uploads", listeners:switchControll)
//                ],
//                heightForFooter: 10.0
//            ),
            Section(
                header: "MANAGEMENT",
                footer: "",
                CellPacks: [
                    TextCellPack(TextCellContent(title: "Space Used",detail: "")),
                    TextCellPack(LegalContent),
                    TextCellPack(keepDaysContnet),
                    TextCellPack(TextCellContent(title: "Connected",detail: "UPnP")),
                    TextCellPack(shareContent),
                ],
                heightForFooter: 10.0
            )
//            Section(
//                header: "",
//                footer: "",
//                CellPacks: [
//                    ButtonCellPack(title: "Sign out",color: UIColor(red: 0.8, green: 0.5, blue: 0.5, alpha: 1))
//                ],
//                heightForFooter: 10.0
//            )
        ]
        return sections
    }

//    func shareTable() -> TableContent{
//        return TableContent(allowsSelection: true)
//    }
//
//    func tickTable() -> TableContent{
//        return TableContent(delegate: TickTableDelegate(), allowsSelection: true)
//    }

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

