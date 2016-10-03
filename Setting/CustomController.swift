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

    func creatOption() -> [UITableViewCell]{
        var optionCell = [UITableViewCell]()
        for str in option as [String]{
            let cell = UITableViewCell(style: .value1,reuseIdentifier: nil)
            cell.textLabel?.text = str
            cell.detailTextLabel?.text = ""
            cell.selectionStyle = .none
            optionCell.append(cell)
        }
        return optionCell
    }
}


class CustomController: SettingController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
//                    AccessoryCell(text: "Legal and Privacy",detail: ""),
                    AccessoryCell(text: "Keep Days",detail: "5 days",cellArray: modelData.creatOption()),
                    TextCell(text: "Connected",detail: "UPnP"),
//                    AccessoryCell(text: "Share Management",detail: ""),
                    ],
                heightForFooter: 10.0
            )
        ]

        // Do any additional setup after loading the view, typically from a nib.
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

