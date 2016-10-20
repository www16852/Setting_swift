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
    var tableSections = [Section]()
    var controllers:listenerContainer!
    var p:PushController!

    override func viewDidLoad() {
        super.viewDidLoad()
        p = PushController(controller:self)
        controllers = listenerContainer(listeners:[p])
        setTableSections()
        let content = TableContent(frame: view.bounds)
        let tableview = SettingTableView(content: content,tableSections: tableSections)
        view.addSubview(tableview)

        // Do any additional setup after loading the view, typically from a nib.
    }

    func setTableSections(){

        self.tableSections = [
            Section(
                header: "ACCOUNT",
                footer: "",
                CellPacks: [
                    TextCellPack(title: "Email",detail: userEmail, listeners:controllers),
                    TextCellPack(title: "Device",detail: userDevice),
                    TextCellPack(title: "Version",detail: version)
                ],
                heightForFooter: 10.0
            ),
            Section(
                header: "SETTING",
                footer: "",
                CellPacks: [
                    SwitchCellPack(title: "Carmera Uploads")
                ],
                heightForFooter: 10.0
            ),
            Section(
                header: "MANAGEMENT",
                footer: "",
                CellPacks: [
                    TextCellPack(title: "Space Used",detail: ""),
                    AccessoryCellPack(title: "Legal and Privacy", detail: "", tableContent:shareTable(), sections: [Section]()),
                    AccessoryCellPack(title: "Keep Days",detail: "5 days", tableContent:tickTable(), sections: CellMaker.makeTickSections(header:"choose Keep Days", options:dayOption)),
                    TextCellPack(title: "Connected",detail: "UPnP"  ),
                    AccessoryCellPack(title: "Share Management",detail: "", tableContent:shareTable(), sections: CellMaker.makeSections(header:"Share Management", options:shareOption))
                ],
                heightForFooter: 10.0
            ),
            Section(
                header: "",
                footer: "",
                CellPacks: [
                    ButtonCellPack(title: "Sign out",color: UIColor(red: 0.8, green: 0.5, blue: 0.5, alpha: 1))
                ],
                heightForFooter: 10.0
            )
        ]
    }

    func shareTable() -> TableContent{
        return TableContent(allowsSelection: true)
    }

    func tickTable() -> TableContent{
        return TableContent(delegate: TickTableDelegate(), allowsSelection: true)
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

