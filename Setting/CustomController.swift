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

class CustomController: SettingController {

    @IBOutlet weak var customTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .top

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
                    AccessoryCell(text: "Legal and Privacy",detail: ""),
                    AccessoryCell(text: "Keep Days",detail: "5 days"),
                    TextCell(text: "Connected",detail: "UPnP"),
                    AccessoryCell(text: "Share Management",detail: ""),
                    ],
                heightForFooter: 10.0
            )
        ]

        // Do any additional setup after loading the view, typically from a nib.
    }

    private func showDetail() {
        let controller = UIViewController()
        controller.view.backgroundColor = UIColor.white
        controller.title = "TEST"
        navigationController?.pushViewController(controller, animated: true)
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

