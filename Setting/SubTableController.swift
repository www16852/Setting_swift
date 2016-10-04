//
//  SubTableController.swift
//  Setting
//
//  Created by waltoncob on 2016/9/30.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

class SubTableController: SettingController {

    var detailTable:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTable = UITableView()
        self.view.addSubview(detailTable)
        self.tableSet()
        self.setupViews()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillDisappear(_ animated: Bool){
        if let indexPath = detailTable.indexPathForSelectedRow , let cell = detailTable.cellForRow(at: indexPath){
            cell.accessoryType = .none
        }
        super.viewWillDisappear(animated)
    }

    private func tableSet(){
        detailTable.allowsSelection = true
        detailTable.delegate = self
        detailTable.dataSource = self
    }

    func setupViews(){

    //Constraint
        detailTable.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .top, relatedBy: .equal, toItem: view , attribute: .top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .bottom, relatedBy: .equal, toItem: view , attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .left, relatedBy: .equal, toItem: view , attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .right, relatedBy: .equal, toItem: view , attribute: .right, multiplier: 1, constant: 0))
    }

    //MAKE: Delegate

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }

    override public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }

    //MAKE:
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }  
    }
    
}
