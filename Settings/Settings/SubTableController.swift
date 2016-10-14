//
//  SubTableController.swift
//  Setting
//
//  Created by waltoncob on 2016/9/30.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

class SubTableController: UIViewController {

    var tableSections = [Section]()
    var settingController:SettingController
    var detailTable:UITableView!
    var tableContent:TableContent

    init(content:TableContent,tableSections:[Section],controller:SettingController){
        self.tableContent = content
        self.tableSections = tableSections
        self.settingController = controller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTable = SettingTableView(content: tableContent,tableSections: tableSections,controller: self.settingController)
        self.view.addSubview(detailTable)
        self.setupViews()
        settingController = SettingController(controller:self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupViews(){
    //Constraint
        detailTable.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .top, relatedBy: .equal, toItem: view , attribute: .top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .bottom, relatedBy: .equal, toItem: view , attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .left, relatedBy: .equal, toItem: view , attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .right, relatedBy: .equal, toItem: view , attribute: .right, multiplier: 1, constant: 0))
    }

    //MAKE:
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }  
    }
    
}
