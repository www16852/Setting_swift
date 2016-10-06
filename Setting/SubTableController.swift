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
    var settingController:SettingController!
    var detailTable:UITableView!

    convenience init(tableSections:[Section],controller:SettingController){
        self.init(nibName: nil, bundle: nil)
        self.tableSections = tableSections
        self.settingController = controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTable = SettingTableView(frame: view.bounds,tableSections: tableSections,controller: self.settingController)
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
