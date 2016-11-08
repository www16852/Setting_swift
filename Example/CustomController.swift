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
        section1.add(cellPack:TextCellPack(TextCellContent(title: "Email",detail: userEmail)))
        section1.add(cellPack:TextCellPack(TextCellContent(title: "Device",detail: userDevice)))
        section1.add(cellPack:TextCellPack(TextCellContent(title: "Version",detail: version)))
        sections.append(section1)

        let section2 = Section(header: "SETTING")

        let alertContent = ButtonCellContent(title:"Carmera Uploads", isOn:false)
        let alertListener = AlertListener(controller:self)
        let saveListener = SaveListener(plist:plistManager)
        alertContent.add(turnOnListener: alertListener)
        alertContent.add(tapListener: saveListener)
        section2.add(cellPack:ButtonCellPack(alertContent))
        sections.append(section2)

        let section3 = Section(header: "MANAGEMENT")
        section3.add(cellPack:TextCellPack(TextCellContent(title: "Space Used",detail: "")))

        let LegalCellContent = TextCellContent(title: "Legal and Privacy", detail: "")
        let LegalPsuhTable = TableContent(sections:makeSections(header:"", options:[]))
        LegalCellContent.set(pushTableContent: LegalPsuhTable)
        section3.add(cellPack: TextCellPack(LegalCellContent))

        let keepDaysCellContnet = TextCellContent(title: "Keep Days", detail: "5 days")
        let keepDaysPushTable = TableContent(sections:makeSections(header:"choose Keep Days", options:dayOption), delegate: TickTableDelegate(), allowsSelection:true)
        let pushListener = PushListener(controller:self, plist:plistManager)
        keepDaysCellContnet.set(pushTableContent:keepDaysPushTable)
        keepDaysCellContnet.add(tapListener:pushListener)
        section3.add(cellPack:TextCellPack(keepDaysCellContnet))

        section3.add(cellPack:TextCellPack(TextCellContent(title: "Connected",detail: "UPnP")))

        let shareCellContent = TextCellContent(title: "Share Management", detail: "")
        let sharePushTable = TableContent(sections:makeSections(header:"Share Management", options:shareOption), allowsSelection:true)
        let pushShareListener = ShareListener(controller:self)
        shareCellContent.set(pushTableContent:sharePushTable)
        shareCellContent.add(tapListener: pushShareListener)
        section3.add(cellPack:TextCellPack(shareCellContent))

        section3.add(cellPack:ButtonCellPack(ButtonCellContent(title:"Sign out")))


        sections.append(section3)


        let cellContents = firstCellContents(sections)
        plistManager.setup(cellContents:cellContents)
        print("Plist path : \(plistManager.plistPathInDocument)")
        plistManager.adjustCellContents()

        let tableContent = TableContent(sections:sections)

        let tableview = SettingTableView(content:tableContent)
        view = tableview


    }

    func firstCellContents(_ sections:[Section]) -> [CellContent]{
        var cellContents:[CellContent] = []
        for section in sections{
            for pack in section.getCellPacks(){
                cellContents.append(pack.getCellContent())
            }
        }
        return cellContents
    }

    func makeSections(header:String, options:[String]) -> [Section]{
        var optionCellPacks = [MakeCellProtocol]()
        for str in options {
            let content = TextCellContent(title: str,detail: "", addTrigger:false)
            optionCellPacks.append(TextCellPack(content))
        }
        let tableSection = [
            Section(
                header: header,
                CellPacks: optionCellPacks
            )
        ]
        return tableSection
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
//                    SwitchCellPack(title: "Carmera Uploads", tapListeners:switchControll)
//                ],
//                heightForFooter: 10.0
//            ),
            Section(
                header: "MANAGEMENT",
                footer: "",
                CellPacks: [
                    TextCellPack(TextCellContent(title: "Space Used",detail: "")),
//                    TextCellPack(LegalContent),
//                    TextCellPack(keepDaysContnet),
                    TextCellPack(TextCellContent(title: "Connected",detail: "UPnP")),
//                    TextCellPack(shareContent),
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

