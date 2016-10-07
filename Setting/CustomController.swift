//
//  CustomController.swift
//  Setting
//
//  Created by waltoncob on 2016/9/29.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

let userEmail = "Box03@walton.com.tw"
let userDevice = "WAS-14-003"
let version = "1.0.13"

class ModelData{
    var text = "Keep Days"
    var detail = "5 days"
    var option:[String] = ["5days","10days","15days","20days"]
    var shareOption:[String] = ["t1@walton.com.tw","t2@walton.com.tw","t3@walton.com.tw","t4@walton.com.tw"]

    func creatSections() -> [Section]{
        var optionCell = [UITableViewCell]()
        for str in option as [String]{
            let cell = UITableViewCell(style: .value1,reuseIdentifier: nil)
            cell.textLabel?.text = str
            cell.detailTextLabel?.text = ""
            cell.selectionStyle = .none
            optionCell.append(cell)
        }
        let tableSection = [
            Section(
                header: "choose Keep Days",
                footer: "",
                settingsCells: optionCell,
                heightForFooter: 10.0
            )
        ]
        return tableSection
    }

    func creatShareSections() -> [Section]{
        var optionCell = [UITableViewCell]()
        for str in shareOption as [String]{
            let cell = UITableViewCell(style: .value1,reuseIdentifier: nil)
            cell.textLabel?.text = str
            cell.detailTextLabel?.text = ""
            optionCell.append(cell)
        }
        let tableSection = [
            Section(
                header: "Share Management",
                footer: "",
                settingsCells: optionCell,
                heightForFooter: 10.0
            )
        ]
        return tableSection
    }
}


class CustomController: UIViewController {
    var tableSections = [Section]()
    var settingController:SettingController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableSections()
        settingController = SettingController(controller:self)
        let content = TableContent(frame: view.bounds)
        let tableview = SettingTableView(content: content,tableSections: tableSections,controller: self.settingController)
        view.addSubview(tableview)

        // Do any additional setup after loading the view, typically from a nib.
    }

    func setTableSections(){

        let modelData = ModelData()
        self.tableSections = [
            Section(
                header: "ACCOUNT",
                footer: "",
                settingsCells: [
                    TextCell(text: "Email",detail: userEmail),
                    TextCell(text: "Device",detail: userDevice),
                    TextCell(text: "Version",detail: version)
                ],
                heightForFooter: 10.0
            ),
            Section(
                header: "SETTING",
                footer: "",
                settingsCells: [
                    SwitchCell(text: "Carmera Uploads")
                ],
                heightForFooter: 10.0
            ),
            Section(
                header: "MANAGEMENT",
                footer: "",
                settingsCells: [
                    TextCell(text: "Space Used",detail: ""),
                    AccessoryCell(text: "Legal and Privacy", detail: "", tableContent:shareTable(), sections: [Section]()),
                    AccessoryCell(text: "Keep Days",detail: "5 days", tableContent:tickTable(), sections: modelData.creatSections()),
                    TextCell(text: "Connected",detail: "UPnP"),
                    AccessoryCell(text: "Share Management",detail: "", tableContent:shareTable(), sections: modelData.creatShareSections())
                ],
                heightForFooter: 10.0
            )
        ]
    }

    func shareTable() -> TableContent{
        return TableContent(delegate: nil, allowsSelection: true)
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

