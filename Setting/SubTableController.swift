//
//  SubTableController.swift
//  Setting
//
//  Created by waltoncob on 2016/9/30.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

class SubTableContoller: SettingController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        self.view.addSubview(tableview)
        self.setupViews()

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

    func setupViews(){
        tableview.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: tableview, attribute: .top, relatedBy: .equal, toItem: view , attribute: .top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableview, attribute: .bottom, relatedBy: .equal, toItem: view , attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableview, attribute: .left, relatedBy: .equal, toItem: view , attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableview, attribute: .right, relatedBy: .equal, toItem: view , attribute: .right, multiplier: 1, constant: 0))
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
