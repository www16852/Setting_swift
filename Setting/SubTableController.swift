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
        tableview.reloadData()

        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupViews(){
        view.addConstraint(NSLayoutConstraint(item: tableview, attribute: .right, relatedBy: .equal, toItem: super.view, attribute: .right, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableview, attribute: .left, relatedBy: .equal, toItem: super.view, attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: bottomLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableview, attribute: .top, relatedBy: NSLayoutRelation.equal, toItem: super.view, attribute: .top, multiplier: 1, constant: 0))
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
